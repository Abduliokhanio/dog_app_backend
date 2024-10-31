class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.text :img
      t.string :ssn
      t.string :email

      t.timestamps
    end
    add_index :users, :ssn, unique: true
    add_index :users, :email, unique: true
  end
end
