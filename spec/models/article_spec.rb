# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Article, type: :model do
  context 'validations' do
    it 'requires title' do
      article = described_class.new(title: '')
      article.valid?
      expect(article.errors[:title]).to include("can't be blank")
      expect(article.errors[:title]).not_to be_empty
      expect(article).not_to be_valid
    end
  end
end
