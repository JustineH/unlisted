class RemoveStreetNameStreetNumber < ActiveRecord::Migration
  def change
    remove_column :listings, :street_number, :string
    remove_column :listings, :street_name, :string
  end
end
