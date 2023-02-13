# frozen_string_literal: true

FactoryBot.define do
  factory :rating do
    rating { Faker::Number.between(from: 1, to: 10) }
    is_approved { false }
    article { nil }
  end
end
