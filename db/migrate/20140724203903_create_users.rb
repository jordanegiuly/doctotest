class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :last_name
      t.string :first_name
      t.string :address
      t.integer :postal_code
      t.string :city
      t.integer :specialty

      t.timestamps
    end
  end
end
