class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.string  :name,        null: false
      t.string  :room_key,    null: false
      t.integer :host_id,     null: false
      t.date    :wedding_day, null: false
      t.timestamps
    end
  end
end
