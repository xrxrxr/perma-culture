require 'rails_helper'

RSpec.describe "posts/new", type: :view do
  before(:each) do
    assign(:post, Post.new(
      :index => "MyString",
      :edit => "MyString",
      :show => "MyString",
      :new => "MyString"
    ))
  end

  it "renders new post form" do
    render

    assert_select "form[action=?][method=?]", posts_path, "post" do

      assert_select "input[name=?]", "post[index]"

      assert_select "input[name=?]", "post[edit]"

      assert_select "input[name=?]", "post[show]"

      assert_select "input[name=?]", "post[new]"
    end
  end
end
