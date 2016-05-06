#!/usr/bin/env rake
# encoding: utf-8
require 'bundler/setup'
require 'rspec/core/rake_task'

# load rake tasks from ./tasks/**
Dir.glob(File.join(__dir__, 'tasks', '**', '*.rb'), &method(:require))

desc 'Run all tests on Travis'
task :travis => ['style', 'spec', 'integration:cloud']

# Default
task :default => %w(style spec)
