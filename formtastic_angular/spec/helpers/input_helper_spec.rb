require 'spec_helper'

describe 'Formtastic::FormBuilder#input' do
  include FormtasticSpecHelper

  before do
    @output_buffer = ''

    #stub(:input_class, FormtasticAngular::Inputs::StringInput)
  end

  it 'should create a "data-ng-model" attribute for an input' do
    concat(angular_form_for('user', url: '/hello') do |builder|
      concat(builder.input(:title))
    end)
    output_buffer.should have_tag("form li input[data-ng-model='user.title']")
  end

  it 'should create an angular error template for an input' do
    concat(angular_form_for('user', url: '/hello') do |builder|
      concat(builder.input(:title))
    end)
    output_buffer.should have_selector("form li p", content: "{{user.errors.title.join(', ')}}")
  end
end
