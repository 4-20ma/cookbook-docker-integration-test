# encoding: utf-8
name              'docker-integration-test'
maintainer        'Doc Walker'
maintainer_email  '4-20ma@wvfans.net'
description       'Tests chef cookbook using docker for integration tests.'
long_description  IO.read(File.join(__dir__, 'README.md'))
license           'Apache 2.0'
version           '1.1.1'
issues_url        'https://github.com/4-20ma/cookbook-docker-integration-test/issues' if respond_to?(:issues_url)
source_url        'https://github.com/4-20ma/cookbook-docker-integration-test' if respond_to?(:source_url)

#--------------------------------------------------------------------- recipes
recipe            'default',
                  'Tests chef cookbook using docker for integration tests.'

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
