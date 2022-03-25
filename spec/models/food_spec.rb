require 'rails_helper'

RSpec.describe Food, type: :model do
  current_user = User.first_or_create!(email: 'dean@example.com', password: 'password', password_confirmation: 'password')

  subject{
    described_class.new(name: 'Sushi',
                        cuisine: 'Japanese',
                        description: 'A staple rice dish, consisting of cooked rice flavoured with vinegar and a variety of vegetable, egg, or raw seafood garnishes and served cold.',
                        user: current_user)
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid  
  end

  it "is not valid without a name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a cuisine" do
    subject.cuisine = nil 
    expect(subject).to_not be_valid
  end

  it "is not valid without a description" do
    subject.description = nil 
    expect(subject).to_not be_valid
  end
  it "is not valid without a user" do
    subject.user = nil 
    expect(subject).to_not be_valid
  end
end
