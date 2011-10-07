require "bundler/gem_tasks"
require "rspec/core/rake_task"
require "yard"

desc "Run specs"
RSpec::Core::RakeTask.new do |t|
  t.pattern = "spec/**/*_spec.rb"
end

YARD::Rake::YardocTask.new do |t|
end

task :default => :spec