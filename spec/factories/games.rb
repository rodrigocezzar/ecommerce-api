# frozen_string_literal: true

FactoryBot.define do
  factory :game do
    mode { %i[pvp pve both].sample }
    release_date { '2022-10-15 20:03:20' }
    developer { Faker::Company.name }
    system_requirement
  end
end
