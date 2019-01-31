require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'Post creation' do 
    before do
      @user = FactoryBot.create(:user)
      @post = FactoryBot.create(:post)
    end
      
    it 'should be created' do 
        expect(@post).to be_valid
    end
    
    it 'should validate presence of date and rationale' do 
        @post.rationale=nil
        @post.date=nil
        expect(@post).to be_invalid
    end
    
    it 'should be associated with the user' do 
      expect(@post.user_id).to eq(User.last.id)
    end
    
    it 'should have a default status of 0 when created' do 
      expect(@post.read_attribute_before_type_cast(:status)).to eq(0)
    end
    
    it 'should display a status as enum' do 
      expect(@post.submitted?).to be(true)
    end
  end
end