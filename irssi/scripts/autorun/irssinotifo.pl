use strict;
use warnings;

#####################################################################
# This script sends notifications to your
# iPhone using the Notifo API when you are away.
#
#
# Commands:
# /set irssinotifo_username USERNAME                (Default NULL)
# /set irssinotifo_API	    API_KEY                 (Default NULL)
# /set irssinotifo_general_hilight on/off           (Default OFF)
#
# "General hilight" basically referrs to ALL the hilights you have
# added manually in irssi, if many, it can get really bloated if
# turned on. Default is Off.
#
# You will need the following packages:
# LWP::UserAgent (You can install this using cpan -i LWP::UserAgent)
# Crypt::SSLeay  (You can install this using cpan -i Crypt::SSLeay)
# 
# Or if you're using Debian GNU/Linux:
# apt-get update;apt-get install libwww-perl libcrypt-ssleay-perl
#
#
# eth0 will prevail. || irc.eth0.info
#
#####################################################################


use Irssi;
use Irssi::Irc;
use vars qw($VERSION %IRSSI);

use LWP::UserAgent;
use HTTP::Request::Common;
use URI::Escape

$VERSION = "0.1";

%IRSSI = (
    authors     => "Caesar 'sniker' Ahlenhed",
    contact     => "sniker\@se.linux.org",
    name        => "irssinotifo",
    description => "Sends notifonotifications when away (iOS AND ANDROID)",
    license     => "GPLv2",
    url         => "http://sniker.codebase.nu",
    changed     => "Mon Mar 17 23:59:32 CET 2011",
);

# Configuration settings and default values.
Irssi::settings_add_bool("irssinotifo", "irssinotifo_general_hilight", 0);
Irssi::settings_add_str("irssinotifo", "irssinotifo_username", "");
Irssi::settings_add_str("irssinotifo", "irssinotifo_API", "");

sub send_noti {
    my ($title, $text) = @_;

    my %options = ();

    $options{'label'} ||= "Irssi";
    $options{'title'} = $title;
    $options{'msg'} = uri_escape($text);
    
    my ($userAgent, $req, $response);
    $userAgent = LWP::UserAgent->new;
    $userAgent->agent("irssinotifo/1.0");
    
    $req = POST("https://api.notifo.com/v1/send_notification",
                [
                  label => $options{'label'}, 
                  msg => $options{'msg'},
                  title => $options{'title'},
                ]
    );
    $req->authorization_basic(Irssi::settings_get_str("irssinotifo_username") => Irssi::settings_get_str("irssinotifo_API"));
    
    $response = $userAgent->request($req);

    if ($response->is_success) {
        # I guess it worked, eh?
    } else {
        Irssi::print("Notification not posted: " . $response->content);
    }
}

sub pubmsg {
    my ($server, $data, $nick) = @_;

    if($server->{usermode_away} == 1 && $data =~ /$server->{nick}/i){
        send_noti("Hilighted", $nick . ': ' . $data);
    }
}

sub privmsg {
    my ($server, $data, $nick) = @_;
    if($server->{usermode_away} == 1){
        send_noti("PM", $nick . ': ' . $data);
    }
}

sub genhilight {
    my($dest, $text, $stripped) = @_;
    my $server = $dest->{server};

    if($dest->{level} & MSGLEVEL_HILIGHT) {
        if($server->{usermode_away} == 1){
            if(Irssi::settings_get_bool("irssinotifo_general_hilight")){
                send_noti("General Hilight", $stripped);
            }
        }
    }
}

Irssi::signal_add_last('message public', 'pubmsg');
Irssi::signal_add_last('message private', 'privmsg');
Irssi::signal_add_last('print text', 'genhilight');
