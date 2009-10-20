IRB.conf[:AUTO_INDENT] = true
IRB.conf[:USE_READLINE] = true
IRB.conf[:PROMPT_MODE] = :CLASSIC

begin
  require 'rubygems'
rescue LoadError => err
  warn "Couldn't load RubyGems: #{err}"
end

begin
  # Wirble autoloads pp and irb/completion, it also enables history
  require 'wirble'
  Wirble.init
  Wirble.colorize
rescue LoadError => err
  warn "Couldn't load Wirble: #{err}"
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
if ENV.include?('RAILS_ENV')
  rails_root = File.basename(Dir.pwd)
  IRB.conf[:PROMPT] ||= {}
  IRB.conf[:PROMPT][:RAILS] = {
    :PROMPT_I => "#{rails_root}> ",
    :PROMPT_S => "#{rails_root}%l ",
    :PROMPT_C => "#{rails_root}? ",
    :RETURN   => "=> %s\n"
  }
  IRB.conf[:PROMPT_MODE] = :RAILS

  # Called after the irb session is initialized and Rails has
  # been loaded (props: Mike Clark).
  IRB.conf[:IRB_RC] = Proc.new do
    ActiveRecord::Base.logger = Logger.new(STDOUT)
    ActiveRecord::Base.instance_eval { alias :[] :find }
  end
end
