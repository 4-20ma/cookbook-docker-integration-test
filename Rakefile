#!/usr/bin/env rake
# encoding: utf-8
require 'bundler/setup'
require 'rspec/core/rake_task'
require_relative 'lib/string'

#---------------------------------------------------------- load configuration
require'yaml'
@config = YAML.load_file(File.join(__dir__, 'Rakefile.yml'))

#--------------------------------------------------------- load external tasks
# load rake tasks from ./tasks/**
Dir.glob(File.join(__dir__, 'tasks', '**', '*.rb'), &method(:require))

#----------------------------------------------------------------------- tasks
desc 'Run all tests on Travis'
# task :travis => ['style', 'spec', 'integration:cloud']
task :travis => ['style', 'spec']

# Default
task :default => ['style', 'style:travis', 'spec']
