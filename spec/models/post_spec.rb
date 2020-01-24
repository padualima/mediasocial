require 'rails_helper'

RSpec.describe Post, type: :model do
  it "is valid saved post with value params NIL" do
    post = Post.create(
      body: nil,
      link_social: nil,
      user_id: nil,
      list_id: nil,
      account_id: nil
    )
    expect(post).not_to be_valid
  end
  it "is valid saved post only params body" do
    post = Post.create(
      body: "Testing",
      link_social: nil,
      user_id: nil,
      list_id: nil,
      account_id: nil
    )
    expect(post).not_to be_valid
  end
  
end
