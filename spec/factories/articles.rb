# frozen_string_literal: true

FactoryBot.define do
  factory :article do
    title { Faker::Hipster.sentence }
    excerpt { Faker::Hipster.paragraph }
    body { Faker::Hipster.paragraphs(number: rand(5..9)).join("\n\n") }
    released_at { Time.current - rand(20).days }
  end
end
