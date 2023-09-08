require 'rails_helper'

RSpec.describe Room, type: :model do
  before do
    user = FactoryBot.create(:user)
    @room = FactoryBot.build(:room, host_id: user.id)
  end

  describe 'ルーム作成' do
    context '新規作成できるとき' do
      it '正常ならば作成できる' do
        expect(@room).to be_valid
      end
    end

    context '作成できないとき' do
      it 'nameが空では作成できない' do
        @room.name = ''
        @room.valid?
        expect(@room.errors.full_messages).to include("Name can't be blank")
      end

      it 'host_id空では作成できない' do
        @room.host_id = nil
        @room.valid?
        expect(@room.errors.full_messages).to include("Host can't be blank")
      end

      it 'wedding_dayが空では作成できない' do
        @room.wedding_day = ''
        @room.valid?
        expect(@room.errors.full_messages).to include("Wedding day can't be blank")
      end

      it 'room_pathが空では作成できない' do
        @room.room_path = ''
        @room.valid?
        expect(@room.errors.full_messages).to include("Room path can't be blank")
      end

      it '重複したroom_pathが存在する場合作成できない' do
        @room.save
        another_room = FactoryBot.build(:room, host_id: @room.host_id, room_path: @room.room_path)
        another_room.valid?
        expect(another_room.errors.full_messages).to include('Room path は既に使用されています')
      end
    end
  end
end
