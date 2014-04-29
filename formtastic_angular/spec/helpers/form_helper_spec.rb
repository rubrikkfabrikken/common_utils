require 'spec_helper'

describe 'FormHelper' do
  include FormtasticSpecHelper

  before do
    @output_buffer = ''
  end

  describe '#angular_form_for' do
    it 'yields an instance of FormtasticAngular::FormBuilder' do
      angular_form_for('user', url: '/hello') do |builder|
        builder.class.should == FormtasticAngular::FormBuilder
      end
    end

    it 'adds a "data-ng-submit" attribute to the generated form' do
      concat(angular_form_for('user', :url => '/hello') do |builder|
      end)
      output_buffer.should have_selector("form[data-ng-submit='$event.preventDefault(); user_submit()']")
    end
  end
end
