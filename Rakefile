# frozen_string_literal: true

require 'English'
require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'

RSpec::Core::RakeTask.new(:spec)

RuboCop::RakeTask.new


namespace :travis do
  desc 'Run rspec'
  task :rspec do
    puts 'Starting to run rspec...'
    system('bundle exec rake rspec')
    raise 'rspec failed!' unless $CHILD_STATUS.exitstatus.zero?
  end

  desc 'Run rubocop'
  task :rubocop do
    puts 'Starting to run rubocop...'
    system('bundle exec rake rubocop')
    raise 'rubocop failed!' unless $CHILD_STATUS.exitstatus.zero?
  end
end
