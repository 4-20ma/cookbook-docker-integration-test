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
begin
  require 'kitchen/rake_tasks'
  Kitchen::RakeTasks.new

  desc 'Run all test instances'
  task :kitchen => ['kitchen:all']
rescue LoadError, NameError
  STDOUT.puts '[WARN] Kitchen::RakeTasks not loaded'.yellow
end

# TODO: from sudo cookboook:
# Integration tests. Kitchen.ci
namespace :integration do
  desc 'Run Test Kitchen with Docker'
  task :docker do
    Kitchen.logger = Kitchen.default_file_logger
    Kitchen::Config.new.instances.each do |instance|
      instance.test(:always)
    end
  end
end
