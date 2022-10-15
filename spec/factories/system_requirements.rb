# frozen_string_literal: true

FactoryBot.define do
  factory :system_requirement do
    sequence(:name) { |n| "Basic #{n}" }
    operational_system { Faker::Computer.os }
    storage { '500gb' }
    processor { 'AMD Rayzen 7' }
    memory { '8gb' }
    video_board { 'Geforce x' }
  end
end
