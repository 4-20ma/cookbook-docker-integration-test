# encoding: utf-8
#
# Task:: release
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

#-------------------------------------------------------------- release/tagger
begin
  require 'emeril/rake_tasks'
  Emeril::RakeTasks.new do |t|
    # turn on debug logging
    t.config[:logger].level = :debug

    # set a category for this cookbook
    t.config[:category] = 'Example'

    # explicitly indicate whether to publish to chef supermarket
    t.config[:publish_to_supermarket] = true
  end
rescue LoadError, NameError
  STDOUT.puts '[WARN] Emeril::RakeTasks not loaded'
end
