require 'savon'
require 'cucumber'
require 'yaml'
require 'colorize'
require 'require_all'
require_all 'lib'

Before do |scenario|
  $config = YAML.load_file('config/config.yml')
  @ws = CalculatorWS.new($config['wsdl'])
end

After do |scenario|

end