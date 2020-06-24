# frozen_string_literal: true

namespace :travis do
  desc 'Run rubocop and rspec'
  task :run do
    %w[rubocop rspec].each do |cmd|
      puts "Starting to run #{cmd}..."
      system("bundle exec rake #{cmd}")
      raise "#{cmd} failed!" unless $CHILD_STATUS.exitstatus.zero?
    end
  end
end
