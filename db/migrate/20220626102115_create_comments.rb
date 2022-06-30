# frozen_string_literal: true

class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.references :post
      t.references :user
      t.belongs_to :parent, foreign_key: { to_table: :comments }
      t.text :body

      t.timestamps
    end
  end
end
