# frozen_string_literal: true

require 'English'
require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'

RSpec::Core::RakeTask.new(:spec)

RuboCop::RakeTask.new

namespace :travis do
  desc 'Run rspec and rubocop'
  travis_tasks = %w[spec, rubocop]
  task :run do
    travis_tasks.each do |task|
      puts "Starting to run #{task}..."
      system("bundle exec rake #{task}")
      raise "#{task} failed!" unless $CHILD_STATUS.exitstatus.zero?
    end
  end
end
