require "bundler/gem_tasks"

task :console do
  require 'pry'
  require 'unit_4_multivers'

  def reload!
    # Change 'gem_name' here too:
    files = $LOADED_FEATURES.select { |feat| feat =~ /\/exact_online_rest_api\// }
    files.each { |file| load file }
  end

  ARGV.clear
  Pry.start
end

