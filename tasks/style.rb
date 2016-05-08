# encoding: utf-8
#
# Task:: style
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

# Add custom foodcritic rules from customink and etsy:
# - $ git submodule add git://github.com/customink-webops/foodcritic-rules.git spec/foodcritic/customink
# - $ git submodule add git://github.com/etsy/foodcritic-rules.git spec/foodcritic/etsy

#----------------------------------------------------------------------- style
# Style tests. Rubocop and Foodcritic
namespace :style do
  begin
    require 'rubocop/rake_task'
    desc 'Run Ruby style checks'
    RuboCop::RakeTask.new(:ruby) do |t|
      # t.fail_on_error = true
    end # task
  rescue LoadError, NameError
    STDOUT.puts '[WARN] RuboCop::RakeTask not loaded'.yellow
  end

  begin
    require 'foodcritic'
    foodcritic = @config.fetch('style').fetch('foodcritic')
    desc 'Run Chef style checks'
    FoodCritic::Rake::LintTask.new(:chef) do |t|
      # exclude tags by using ~FC002 notation within :tags array
      t.options = {
        :fail_tags => foodcritic['fail_tags'],
        :include_rules => foodcritic['include_rules'],
        :tags => foodcritic['tags']
      }
    end # task
  rescue LoadError, NameError
    STDOUT.puts '[WARN] FoodCritic::Rake::LintTask not loaded'.yellow
  end

  namespace :chef do
    desc 'Update 3rd-party Chef style rules (foodcritic)'
    task :update do
      sh 'git submodule update --init --recursive'
    end # task
  end # namespace
end # namespace

desc 'Run all style checks'
task :style => ['style:chef', 'style:ruby']
