# frozen_string_literal: true

Article.delete_all

15.times do
  Article.create(
    title: Faker::Hipster.sentence,
    excerpt: Faker::Hipster.paragraph,
    body: Faker::Hipster.paragraphs(number: rand(5..9)).join("\n\n"),
    released_at: Time.current - rand(20).days
  )
end
