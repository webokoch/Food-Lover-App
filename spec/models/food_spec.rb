require 'rails_helper'

RSpec.describe Food, type: :model do
  it "is valid with valid attributes"
  it "is not valid without a name"
  it "is not valid without a cuisine"
  it "is not valid without a description"
  it "is not valid without a user"
end
