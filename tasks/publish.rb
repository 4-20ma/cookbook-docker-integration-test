# encoding: utf-8
#
# Task:: publish
#
# Author:: Doc Walker (<4-20ma@wvfans.net>)
#
# Copyright 2016-2017, Doc Walker
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

#-------------------------------------------------------------- publish/tagger
# Configure path to stove gem config file (add to ~/.bash_profile):
# export STOVE_CONFIG=$HOME/.chef/stove.json

# Update stove gem config file
# $ stove login --username USERNAME --key ~/.chef/USERNAME.pem

begin
  require 'stove/rake_task'
  Stove::RakeTask.new
rescue LoadError, NameError
  STDOUT.puts '[WARN] Stove::RakeTask not loaded'.yellow
end
