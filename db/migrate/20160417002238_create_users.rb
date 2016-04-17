class CreateUsers < ActiveRecord::Migration
  def change
     create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.integer :phone
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.boolean :seller, default: false
      
      t.timestamps
    end
  end
end
