require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid saved " do
    user = User.create(name: "Padua", username: "Lima")
    expect(user).to be_valid
  end

  it "is valid saved without name" do
    user = User.create(name: nil, username: "Lima")
    expect(user).to_not be_valid
  end

  it "if name eq the name saved " do
    user = User.create(name: "Padua", username: "Lima")
    expect(user.name).to eq("Padua")
  end
end
