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
# Integration tests. Kitchen.ci
namespace :integration do
  begin
    require 'kitchen'

    desc 'Run Test Kitchen integration tests with Docker'
    task :docker do
      Kitchen.logger = Kitchen.default_file_logger
      config = {
        :loader => Kitchen::Loader::YAML.new(:project_config =>
          ENV['KITCHEN_YAML'] || '.kitchen.local.yml')
      }
      Kitchen::Config.new(config).instances.each do |instance|
        instance.test(:always)
      end
    end # task
  rescue LoadError, NameError
    STDOUT.puts '[WARN] Kitchen::RakeTasks not loaded'.yellow
  end
end

task :integration => %w(integration:local)

# where
# integration:cloud
# integration:local
# integration:travis

# how
# integration:docker
# integration:vagrant
# integration:parallels
