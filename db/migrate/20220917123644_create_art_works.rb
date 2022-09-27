class CreateArtWorks < ActiveRecord::Migration[6.0]
  def change
    create_table :art_works do |t|
      t.integer :user_id
      t.string :title
      t.string :attachment
      t.timestamps
    end
    add_index :art_works, :title

  end
end
