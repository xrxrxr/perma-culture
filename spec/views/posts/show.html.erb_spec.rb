# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'posts/show', type: :view do
  before(:each) do
    @post = assign(:post, Post.create!(
                            index: 'Index',
                            edit: 'Edit',
                            show: 'Show',
                            new: 'New'
                          ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Index/)
    expect(rendered).to match(/Edit/)
    expect(rendered).to match(/Show/)
    expect(rendered).to match(/New/)
  end
end
