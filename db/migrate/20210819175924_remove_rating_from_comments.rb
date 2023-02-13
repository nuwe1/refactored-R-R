# frozen_string_literal: true

class RemoveRatingFromComments < ActiveRecord::Migration[6.1]
  def change
    remove_column :comments, :rating, :integer
  end
end
