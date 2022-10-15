# frozen_string_literal: true

FactoryBot.define do
  factory :category do
    sequence(:name) { |n| "Caregory #{n}" }
  end
end
