# frozen_string_literal: true

FactoryBot.define do
  factory :coupon do
    code { Faker::Commerce.unique.promotion_code(digits: 6) }
    status { %i[active inative].sample }
    discount_value { rand(1..99) }
    due_date { Time.zone.now + 1.hour }
  end
end
