require 'rails_helper'

RSpec.describe Restaurant, type: :model do
 
  current_user = User.first_or_create!(email: 'user@example.com', password: 'password', password_confirmation: 'password')

  subject{
    described_class.new(name: 'YumYum', 
                        cuisine: 'Korean', 
                        location: 'Mitte', 
                        description: 'Great Korean Food', 
                        user: current_user )
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end
  
  it "is not valid without cuisine" do
    subject.cuisine = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a location" do
    subject.location = nil
    expect(subject).to_not be_valid
  end
  
  it "is not valid without a user" do
    subject.user = nil
    expect(subject).to_not be_valid
  end

  it "is not valid with a description of more than 500 characters" do
    subject.description = "a" * 501
    expect(subject).to_not be_valid
  end

  context 'name uniquness' do
    before { described_class.create!( name: 'yumyum',
                                      cuisine: 'Korean',
                                      location: 'Mitte',
                                      description: "Fish and Rice",
                                      user: current_user) 
    }
    it 'is not valid with same name' do
      expect(subject).to_not be_valid
    end
  end
end
