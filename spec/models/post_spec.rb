require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
  end

  describe '写真投稿' do
    context '写真が投稿できる場合' do
      it '正常ならば保存できる' do
        expect(@post).to be_valid
      end
    end

    context '写真が投稿できない場合' do
      it 'imageが空では保存できない' do
        @post.image = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("Image can't be blank")
      end

      it 'userが紐づいていないと保存できない' do
        @post.user = nil
        @post.valid?
        expect(@post.errors.full_messages).to include('User must exist')
      end

      it 'roomが紐づいていないと保存できない' do
        @post.room = nil
        @post.valid?
        expect(@post.errors.full_messages).to include('Room must exist')
      end
    end
  end
end
