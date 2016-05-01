# encoding: utf-8
require 'spec_helper'

describe 'test::default' do
  #-------------------------------------------- file[/tmp/quick_brown_fox.txt]
  describe file('/tmp/quick_brown_fox.txt') do
    it 'is a file' do
      expect(subject).to be_file
    end # it

    it 'is owned by root' do
      expect(subject).to be_owned_by('root')
    end # it

    it 'is in group root' do
      expect(subject).to be_grouped_into('root')
    end # it

    it 'is mode 600' do
      expect(subject).to be_mode(600)
    end # it
  end # describe

end # describe
