# frozen_string_literal: true

class Rating < ApplicationRecord
  belongs_to :article
  validates :rating, presence: true, allow_blank: false
  validates :rating, numericality: { only_integer: true, allow_nil: true,
                                     greater_than_or_equal_to: 1,
                                     less_than_or_equal_to: 10,
                                     message: 'can only be whole number between 1 and 10.' }
end
