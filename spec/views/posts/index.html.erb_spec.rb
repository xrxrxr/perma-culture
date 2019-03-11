require 'rails_helper'

RSpec.describe "posts/index", type: :view do
  before(:each) do
    assign(:posts, [
      Post.create!(
        :index => "Index",
        :edit => "Edit",
        :show => "Show",
        :new => "New"
      ),
      Post.create!(
        :index => "Index",
        :edit => "Edit",
        :show => "Show",
        :new => "New"
      )
    ])
  end

  it "renders a list of posts" do
    render
    assert_select "tr>td", :text => "Index".to_s, :count => 2
    assert_select "tr>td", :text => "Edit".to_s, :count => 2
    assert_select "tr>td", :text => "Show".to_s, :count => 2
    assert_select "tr>td", :text => "New".to_s, :count => 2
  end
end
