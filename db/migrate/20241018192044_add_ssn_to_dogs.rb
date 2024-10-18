class AddSsnToDogs < ActiveRecord::Migration[6.1]
  def change
    add_column :dogs, :ssn, :string
  end
end
