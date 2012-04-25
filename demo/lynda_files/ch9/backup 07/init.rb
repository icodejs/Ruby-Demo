# Food finder


APP_ROOT = File.dirname(__FILE__)

# require "#{APP_ROOT}/lib/guide"
# require File.join(APP_ROOT, 'lib', 'guide.rb')
# require File.join(APP_ROOT, 'lib', 'guide')

# contains an array of all the file that this project uses
# it checkes the lib dir for the file inside it
# unshift creates an array of files
$:.unshift(File.join(APP_ROOT, 'lib'))

require 'guide'

guide = Guide.new('restaurants.txt')
guide.launch!
