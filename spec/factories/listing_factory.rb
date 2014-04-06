FactoryGirl.define do
  factory :listing do
    description Faker::Business.credit_card_expiry_date
  end
end
