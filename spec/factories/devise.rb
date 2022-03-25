FactoryBot.define do
  factory :user do
    id {99}
    email {"test@user.com"}
    password {"qwerty"}
    password_confirmation {"qwerty"}
  end
end