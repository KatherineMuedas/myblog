class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :category
      t.belongs_to :article, index: true

      t.timestamps
    end
  end
end
