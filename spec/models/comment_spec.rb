# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'with 2 or more comments' do
    it 'orders them chronologically' do
      article = Article.create(title: 'just a title')
      comment1 = article.comments.create!(body: 'first comment')
      comment2 = article.comments.create!(body: 'second comment')
      expect(article.reload.comments).to eq([comment1, comment2])
    end
  end

  context 'validations' do
    it 'requires body' do
      article = Article.create(title: 'just a title')
      comment = article.comments.new(body: '')
      comment.valid?
      expect(comment.errors[:body]).to include("can't be blank")
      expect(comment.errors[:body]).not_to be_empty
      expect(comment).not_to be_valid
    end
  end
end
