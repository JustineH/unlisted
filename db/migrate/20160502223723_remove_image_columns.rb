class RemoveImageColumns < ActiveRecord::Migration
  def change
    remove_column :listings, :image, :string
    remove_column :listings, :image_file_name, :string
    remove_column :listings, :image_content_type, :string
    remove_column :listings, :image_file_size, :integer
    remove_column :listings, :image_updated_at, :datetime
  end
end
