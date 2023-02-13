# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Rating, type: :model do
  context 'validations' do
    it 'requires a rate' do
      article = Article.create(title: 'just a title')
      rate = article.ratings.new
      rate.valid?
      expect(rate.errors[:rating]).to include("can't be blank")
      expect(rate.errors[:rating]).not_to be_empty
      expect(rate).not_to be_valid
    end

    it 'number should be in range of 1 to 10' do
      article = Article.create(title: 'just a title')
      rate = article.ratings.new(rating: 30)
      rate.valid?
      expect(rate.errors[:rating]).to include('can only be whole number between 1 and 10.')
      expect(rate.errors[:rating]).not_to be_empty
      expect(rate).not_to be_valid
    end

    it 'is a number' do
      article = Article.create(title: 'just a title')
      rate = article.ratings.new(rating: '0')
      rate.valid?
      expect(rate.errors[:rating]).to include('can only be whole number between 1 and 10.')
      expect(rate.errors[:rating]).not_to be_empty
      expect(rate).not_to be_valid
    end
  end
end
