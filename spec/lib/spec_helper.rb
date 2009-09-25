$: << File.expand_path(File.dirname(__FILE__) + "/../../lib")

require 'rubygems'
require 'spec'

PRODUCTION_PATH = File.expand_path(File.dirname(__FILE__) + "../../../") unless defined?(PRODUCTION_PATH)
ENV['GEM_HOME'] = File.join(PRODUCTION_PATH , "__resources")
Gem.clear_paths

Dir.glob(File.join("__resources", "gems", "**", "lib")).each do |dir|
  $: << dir
end