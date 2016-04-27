class AddDryerToListings < ActiveRecord::Migration
  def change
    add_column :listings, :dryer, :boolean, default: false
    change_column :listings, :basement, :boolean, default: false
  end
end
