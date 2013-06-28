require 'rubygems'

begin
  require "ap"
  IRB::Irb.class_eval do
    def output_value
      ap @context.last_value
    end
  end
rescue LoadError => e
  puts "ap gem not found.  Try typing 'gem install awesome_print' to get super-fancy output."
end

#begin
#  # load wirble
#  require 'wirble'
#
#  # start wirble (with color)
#  Wirble.init
#  Wirble.colorize
#rescue LoadError => err
#  warn "Couldn't load Wirble: #{err}"
#end

begin
  require 'hirb'
  Hirb.enable
rescue LoadError => e
  warn "Couldn't load Hirb: #{e}"
end

if $0 == 'irb' && ENV['RAILS_ENV']
  require 'logger'
  Object.const_set(:RAILS_DEFAULT_LOGGER, Logger.new(STDOUT))
end

ActiveRecord::Base.logger = Logger.new(STDOUT) if defined? Rails::Console

IRB.conf[:AUTO_INDENT] = true
IRB.conf[:SAVE_HISTORY] = 10000
IRB.conf[:EVAL_HISTORY] = 200


