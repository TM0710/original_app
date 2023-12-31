class CreateFavorites < ActiveRecord::Migration[7.0]
  def change
    create_table :favorites do |t|
      t.references :user,       null: false, foreign_key: true
      t.references :post,       null: false, foreign_key: true
      t.references :room,       null: false, foreign_key: true
      t.integer    :media_id,   null: false
      t.string     :media_type, null: false
      t.timestamps
    end
  end
end
