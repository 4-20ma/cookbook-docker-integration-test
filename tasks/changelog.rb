# encoding: utf-8
#
# Task:: changelog
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

#------------------------------------------------------------------- changelog
# TODO: improve the following:
# - remove bump version commits
# - prepend to CHANGELOG without using changelog.tmp
changelog = @config.fetch('changelog')
desc 'Update changelog with commit messages'
task :changelog, [:tag1, :tag2] do |t, args|
  args.with_defaults(:tag1 => 'v0.1.0', :tag2 => 'HEAD')
  date = `git log -1 --format=%ad #{args[:tag2]} --date=short`
  title = %(#{args[:tag2].gsub(/^v/, '')} / #{date}).chomp
  underline = '-' * title.size
  url = "https://#{changelog['git_repository']}"
  format = %(- "'`'"TYPE"'`'" - %s | [view](#{url}/$basename/commit/%h))
  file = 'changelog.tmp'
  sh <<-EOF
    remote=$(git config --get branch.master.remote)
    url=$(git config --get remote.$remote.url)
    basename=$(basename "$url" .git)
    echo "#{title}\n#{underline}\n" > #{file}
    git log #{args[:tag1]}..#{args[:tag2]} --no-merges \
      --pretty=format:"#{format}" >> #{file}
  EOF
end # task
