class CreateBookmarks < ActiveRecord::Migration
  def change
    create_table :bookmarks do |t|
      t.boolean :favourite, default: false
      t.references :user, index: true, foreign_key: true
      t.references :listing, index: true, foreign_key: true
      t.timestamps 
    end
  end
end


