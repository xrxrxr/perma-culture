# frozen_string_literal: true

class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.datetime :posting_date
      t.belongs_to :writter, index: true
      t.belongs_to :category, foreign_key: true

      t.timestamps
    end
  end
end
