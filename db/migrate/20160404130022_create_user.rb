class CreateUser < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :slug
      t.text :message
      t.integer :shift, :default => 1
      t.string :caesar_cipher
      t.timestamp
    end
  end
end
