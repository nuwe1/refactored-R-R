# frozen_string_literal: true

class Article < ApplicationRecord
  validates :title, presence: true
  has_many :comments, dependent: :destroy
  has_many :ratings, dependent: :destroy

  scope :released, -> { where('released_at < ?', Time.current) }
end
