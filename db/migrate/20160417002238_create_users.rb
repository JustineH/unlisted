class CreateUsers < ActiveRecord::Migration
  def change
     create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.string :phone
      t.string :email
      t.string :encrypted_password
      t.boolean :seller, default: false

      t.timestamps
    end
  end
end
