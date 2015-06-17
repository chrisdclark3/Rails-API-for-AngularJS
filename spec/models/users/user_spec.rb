require 'rails_helper'

RSpec.describe User, type: :model do

  it "should require a first_name" do
    user = User.new(first_name: "")
    user.valid?
    expect(user.errors[:first_name].any?).to eq(true)
  end

  it "should require a last_name" do
    user = User.new(last_name: "")
    user.valid?
    expect(user.errors[:last_name].any?).to eq(true)
  end

  it "should require an email" do
    user = User.new(email: "")
    user.valid?
    expect(user.errors[:email].any?).to eq(true)
  end

  it "should accept properly formatted email" do
    emails = %w[coding@dojo.com coding.dojo@ninja.com]
    emails.each do |email|
      user = User.new(email: email)
      user.valid?
      expect(user.errors[:email].any?).to eq(false)
    end
  end

  it "should reject improperly formatted email" do
    emails = %w[@ kobe@bryant @lakers.com]
    emails.each do |email|
      user = User.new(email: email)
      user.valid?
      expect(user.errors[:email].any?).to eq(true)
    end
  end
end