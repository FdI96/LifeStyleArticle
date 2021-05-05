require 'rails_helper'

RSpec.describe "articles/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        id: 2,
        username: 'Username1',
        password: 'Password',
        email: 'email@email.com'
        )
    ])
    assign(:articles, [
      Article.create!(
        author_id: 2,
        title: "Title",
        text: "MyText",
        image: "Image",
        category_id: 3
      ),
      Article.create!(
        author_id: 2,
        title: "Title",
        text: "MyText",
        image: "Image",
        category_id: 3
      )
    ])
  end

  it "renders a list of articles" do
    render
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: "Title".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "Image".to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
  end
end
