# frozen_string_literal: true

class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :excerpt
      t.string :body
      t.datetime :released_at

      t.timestamps
    end

    add_index :articles, :released_at
  end
end
