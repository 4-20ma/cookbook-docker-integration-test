# encoding: utf-8
#
# Class:: string
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

# https://stackoverflow.com/questions/1489183/colorized-ruby-output
class String
  # colorization
  def colorize(color_code)
    "\e[#{color_code}m#{self}\e[0m"
  end # def

  def red
    colorize(31)
  end # def

  def green
    colorize(32)
  end # def

  def yellow
    colorize(33)
  end # def

  def blue
    colorize(34)
  end # def

  def pink
    colorize(35)
  end # def

  def cyan
    colorize(36)
  end # def
end # class
