# encoding: utf-8
require 'spec_helper'

describe 'docker-integration-test::default' do
  [
    { :platform => 'centos', :version => '6.5' }
  ].each do |i|
    context "#{i[:platform]}/#{i[:version]}" do
      cached(:chef_run) do
        ChefSpec::SoloRunner.new(i) do |node|
        end.converge(described_recipe)
      end # cached

      #---------------------------------------- file[/tmp/quick_brown_fox.txt]
      describe '/tmp/quick_brown_fox.txt' do
        it 'creates file with expected owner, group, mode, content' do
          expect(chef_run).to create_file(subject)
            .with_owner('root').with_group('root').with_mode('0600')
        end # it
      end # describe

    end # context
  end # [...].each

end # describe
