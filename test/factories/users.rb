FactoryGirl.define do
  factory :user do
    first_name 'Name'
    last_name 'LastName'
    email 'user@example.org'
    password 'password'
  end
end
