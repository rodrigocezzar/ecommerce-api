# frozen_string_literal: true

FactoryBot.define do
  factory :coupon do
    code { Faker::Commerce.unique.promotion_code(digits: 6) }
    status { %i[active inative].sample }
    discount_value { rand(1..99) }
    due_date { '2022-10-15 21:35:04' }
  end
end
