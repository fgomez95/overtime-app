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
    
    it 'should validate presence of rationale' do 
        @post.update(rationale: nil)
        expect(@post).to be_invalid
    end
    
    it 'should validate presence of date' do 
      @post.update(date: nil)
      expect(@post).to be_invalid
    end
    
    it 'should validate presence of overtime_request' do 
      @post.update(overtime_request: nil)
      expect(@post).to be_invalid
    end
    
    it 'should validate overtime_request is greater than 0.0' do 
      @post.update(overtime_request: 0.0)
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