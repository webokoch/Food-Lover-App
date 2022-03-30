require 'rails_helper'

RSpec.describe FoodReview, type: :model do
  current_user = User.first_or_create!(email: 'user@example.com', password: 'password', password_confirmation: 'password')
  current_food = Food.first_or_create!(name: 'Burger', cuisine: 'American', description: 'Beef in an bun.', user: current_user)

  subject{
    described_class.new(rating: '3',
                        content: 'Best Japanese dish ever!',
                        food: current_food)
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a rating" do
    subject.rating = nil
    expect(subject).to_not be_valid
  end
  
  it "is not valid without content" do
    subject.content = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a food" do
    subject.food = nil 
    expect(subject).to_not be_valid
  end

  it "is not valid with a content of more than 500 characters" do
    subject.content = "a" * 501
    expect(subject).to_not be_valid
  end

  it "is not valid with a rating lower 0 and higher 5" do
    subject.rating = 0
    expect(subject).to_not be_valid
    subject.rating = 6
    expect(subject).to_not be_valid
  end

end
