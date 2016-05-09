class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.attachment :image
      t.references :listing
      t.timestamps
    end
  end
end
