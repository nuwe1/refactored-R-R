# frozen_string_literal: true

class CreateRatings < ActiveRecord::Migration[6.1]
  def change
    create_table :ratings do |t|
      t.integer :rating
      t.boolean :is_approved
      t.references :article, null: false, foreign_key: true

      t.timestamps
    end
  end
end
