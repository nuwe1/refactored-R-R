# frozen_string_literal: true

class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.string :name
      t.text :body
      t.integer :rating
      t.references :article, null: false, foreign_key: true

      t.timestamps
    end
  end
end
