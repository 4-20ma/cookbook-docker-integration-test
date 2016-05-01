# encoding: utf-8
name              'test'
maintainer        'Doc Walker'
maintainer_email  '4-20ma@wvfans.net'
description       'Tests chef + docker.'
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
license           'Apache 2.0'
version           '0.0.1'
issues_url        nil if respond_to?(:issues_url)
source_url        nil if respond_to?(:source_url)

#--------------------------------------------------------------------- recipes
recipe            'default',
                  'Recipe used to test chef + docker'

#------------------------------------------------------- cookbook dependencies

#--------------------------------------------------------- supported platforms
# tested
supports          'centos'

# platform_family?('rhel'): not tested, but should work
supports          'amazon'
supports          'oracle'
supports          'redhat'
supports          'scientific'

# platform_family?('debian'): not tested, but may work
supports          'debian'
supports          'ubuntu'
