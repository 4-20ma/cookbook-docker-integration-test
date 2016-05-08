# encoding: utf-8
#
# Task:: integration
#
# Author:: Doc Walker (<4-20ma@wvfans.net>)
#
# Copyright 2016, Doc Walker
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

require 'rake'

#----------------------------------------------------------- integration tests
# begin
#   require 'kitchen/rake_tasks'
#   Kitchen::RakeTasks.new
#
#   desc 'Run all test instances'
#   task :kitchen => ['kitchen:all']
# rescue LoadError, NameError
#   STDOUT.puts '[WARN] Kitchen::RakeTasks not loaded'.yellow
# end
#
# # TODO: from sudo cookboook:
# # Integration tests. Kitchen.ci
# namespace :integration do
#   desc 'Run Test Kitchen with Docker'
#   task :docker do
#     Kitchen.logger = Kitchen.default_file_logger
#     Kitchen::Config.new.instances.each do |instance|
#       instance.test(:always)
#     end
#   end
# end
desc 'Run Test Kitchen integration tests'
namespace :integration do
  # Gets a collection of instances.
  #
  # @param regexp [String] regular expression to match against instance names.
  # @param config [Hash] configuration values for the `Kitchen::Config` class.
  # @return [Collection<Instance>] all instances.
  def kitchen_instances(regexp, config)
    instances = Kitchen::Config.new(config).instances
    return instances if regexp.nil? || regexp == 'all'
    instances.get_all(Regexp.new(regexp))
  end

  # Runs a test kitchen action against some instances.
  #
  # @param action [String] kitchen action to run (defaults to `'test'`).
  # @param regexp [String] regular expression to match against instance names.
  # @param loader_config [Hash] loader configuration options.
  # @return void
  def run_kitchen(action, regexp, loader_config = {})
    action = 'test' if action.nil?
    require 'kitchen'
    Kitchen.logger = Kitchen.default_file_logger
    config = { loader: Kitchen::Loader::YAML.new(loader_config) }
    kitchen_instances(regexp, config).each { |i| i.send(action) }
  end

  desc 'Run integration tests with kitchen-vagrant'
  task :vagrant, [:regexp, :action] do |_t, args|
    run_kitchen(args.action, args.regexp)
  end

  desc 'Run integration tests with kitchen-docker'
  task :docker, [:regexp, :action] do |_t, args|
    run_kitchen(args.action, args.regexp, local_config: '.kitchen.docker.yml')
  end
end

task default: %w(integration:vagrant)
