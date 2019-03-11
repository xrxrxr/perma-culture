# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'posts/edit', type: :view do
  before(:each) do
    @post = assign(:post, Post.create!(
                            index: 'MyString',
                            edit: 'MyString',
                            show: 'MyString',
                            new: 'MyString'
                          ))
  end

  it 'renders the edit post form' do
    render

    assert_select 'form[action=?][method=?]', post_path(@post), 'post' do
      assert_select 'input[name=?]', 'post[index]'

      assert_select 'input[name=?]', 'post[edit]'

      assert_select 'input[name=?]', 'post[show]'

      assert_select 'input[name=?]', 'post[new]'
    end
  end
end
