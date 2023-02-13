# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    name { Faker::Name.name }
    body { Faker::Hipster.sentence }
    article { nil }
  end
end
