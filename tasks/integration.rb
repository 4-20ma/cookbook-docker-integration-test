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
namespace :integration do
  begin
    require 'kitchen'

    desc 'Run Test Kitchen integration tests with Docker'
    task :docker, :regex do |t, args|
      args.with_defaults(:regex => '.')
      regex = Regexp.new(args['regex'].to_s.tr('_', '-'))
      Kitchen.logger = Kitchen.default_file_logger
      options = {
        :loader => Kitchen::Loader::YAML.new(:project_config =>
          ENV['KITCHEN_YAML'] || '.kitchen.local.yml'),
        :test_base_path => File.join(Dir.pwd, 'spec', 'integration')
      }
      instances = Kitchen::Config.new(options).instances
      instances.get_all(regex).each do |instance|
        instance.test(:always)
      end # instances
    end # task
  rescue LoadError, NameError
    STDOUT.puts '[WARN] Kitchen::RakeTasks not loaded'.yellow
  end
end # namespace

task :integration => %w(integration:docker)
