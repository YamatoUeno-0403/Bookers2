class CreatePlofileImages < ActiveRecord::Migration[5.2]
  def change
    create_table :plofile_images do |t|
      t.string :image_id
      t.integer :user_id

      t.timestamps
    end
  end
end
