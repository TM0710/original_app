class AddRoomPathToRooms < ActiveRecord::Migration[7.0]
  def change
    add_index :rooms, :room_key, unique: true
  end
end
