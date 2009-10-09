$: << File.expand_path(File.dirname(__FILE__) + "/../../lib")

require 'rubygems'
require 'spec'

unless defined?($PRODUCTION_PATH)
  $PRODUCTION_PATH = File.expand_path(File.dirname(__FILE__) + "/../../") unless defined?($PRODUCTION_PATH)
  Gem.use_paths(File.join($PRODUCTION_PATH , "__resources", "gems"), Gem.default_path)
end

Dir.glob(File.join("__resources", "gems", "gems", "**", "lib")).each do |dir|
  $: << dir
end