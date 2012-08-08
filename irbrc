IRB.conf[:AUTO_INDENT] = true
IRB.conf[:USE_READLINE] = true
IRB.conf[:PROMPT] ||= {}
if IRB.conf[:PROMPT].include? :RVM
  IRB.conf[:PROMPT_MODE] = :RVM
elsif
  IRB.conf[:PROMPT][:MINE] = {
    :PROMPT_I => "%03n:%i:> ",
    :PROMPT_S => "%03n:%i:%l ",
    :PROMPT_C => "%03n:%i:? ",
    :PROMPT_N => "%03n:%i:? ",
    :RETURN   => "=> %s\n"
  }
  IRB.conf[:PROMPT_MODE] = :MINE
end

begin
  require 'rubygems'
rescue LoadError => err
  warn "Couldn't load RubyGems: #{err}"
end

begin
  # load Hirb
  require 'hirb'
  Hirb.enable
rescue LoadError => err
  warn "Couldn't load Hirb: #{err}"
end

# Require UtilityBelt for lots of functionality
# http://utilitybelt.rubyforge.org/

begin
  # Wirble autoloads pp and irb/completion, it also enables history
  require 'wirble'
  Wirble.init
  Wirble.colorize
  # add a little color to the prompt
  if IRB.conf[:PROMPT_MODE] == :MINE
    IRB.conf[:PROMPT][:MINE] = {
      :PROMPT_I => "\e[0;32m%03n\e[0;37m:\e[0;36m%i\e[0;37m:> \e[0;00m",
      :PROMPT_S => "\e[0;32m%03n\e[0;37m:\e[0;36m%i\e[0;37m:%l \e[0;00m",
      :PROMPT_C => "\e[0;32m%03n\e[0;37m:\e[0;36m%i\e[0;37m:? \e[0;00m",
      :PROMPT_N => "\e[0;32m%03n\e[0;37m:\e[0;36m%i\e[0;37m:? \e[0;00m",
      :RETURN   => "=> %s\n"
    }
  end
rescue LoadError => err
  require 'pp'
  require 'irb/completion'
  require 'irb/ext/save-history'
  IRB.conf[:SAVE_HISTORY] = 100
  warn "Couldn't load Wirble: #{err}"
end

begin
  require 'looksee'
  module Kernel
    alias_method :orig_methods, :methods

    def methods(*args)
      # puts caller.first
      if caller.first =~ /\(irb\):\d+(:in `irb_binding')?/
        self.ls(*args)
      else
        orig_methods
      end
    end
  end
rescue LoadError => err
  warn "Couldn't load looksee: #{err}"
end

class Object
  def method_like(regex)
    pp methods.select {|m| m =~ regex}
  end

  def base_methods
    self.methods - Object.methods
  end

  class << self
    def method_like(regex)
      pp methods.select {|m| m =~ regex}
    end

    def base_methods
      self.methods - Object.methods
    end
  end
end


# Just for Rails...
if ENV.include?('RAILS_ENV') || defined?(Rails)
  rails_root = File.basename(Dir.pwd)
  IRB.conf[:PROMPT] ||= {}
  IRB.conf[:PROMPT][:RAILS] = {
    :PROMPT_I => "#{rails_root}> ",
    :PROMPT_S => "#{rails_root}%l ",
    :PROMPT_C => "#{rails_root}? ",
    :PROMPT_N => "#{rails_root}? ",
    :RETURN   => "=> %s\n"
  }
  IRB.conf[:PROMPT_MODE] = :RAILS

  # Called after the irb session is initialized and Rails has
  # been loaded (props: Mike Clark).
  # IRB.conf[:IRB_RC] = Proc.new do
    # ActiveRecord::Base.logger = Logger.new(STDOUT)
    # ActiveRecord::Base.instance_eval { alias :[] :find }
  # end

  require 'logger'
  # if defined?(Rails) && Rails.respond_to?(:logger=)
    # Rails.logger = Logger.new(STDOUT)
    # ActiveRecord::Base.logger = Rails.logger
  # else
    # Object.const_set(:RAILS_DEFAULT_LOGGER, Logger.new(STDOUT))
  # end

  def loud_logger
    set_logger_to Logger.new(STDOUT)
  end

  def quiet_logger
    set_logger_to nil
  end

  def set_logger_to(logger)
    if defined?(Rails) && Rails.respond_to?(:logger=)
      Rails.logger = logger
      ActiveRecord::Base.logger = Rails.logger
      ActiveRecord::Base.clear_active_connections!
    else
      Object.const_set(:RAILS_DEFAULT_LOGGER, logger)
    end
    # ActiveRecord::Base.logger = logger
  end

end

RUBY_PATCHLEVEL = 0 if not defined? RUBY_PATCHLEVEL

## Notify us of the version and that it is ready.
puts "Ruby #{RUBY_VERSION}-p#{RUBY_PATCHLEVEL} (#{RUBY_RELEASE_DATE}) #{RUBY_PLATFORM}"
