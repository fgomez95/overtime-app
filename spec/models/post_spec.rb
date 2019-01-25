require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "Post creation" do 
    before do
      @user = User.create!(
        first_name:'John', 
        last_name:'Doe', 
        email:'some@email.com', 
        password:'secret', 
        password_confirmation:'secret')
      @post = @user.posts.create!(
        date: Date.current, 
        rationale: "Some text")
    end
      
    it "should be created" do 
        expect(@post).to be_valid
    end
    
    it "should validate presence of date and rationale" do 
        @post.rationale=nil
        @post.date=nil
        expect(@post).to be_invalid
    end
    
    it "should be associated with the user" do 
      expect(@post.user_id).to eq(@user.id)
    end
  end
end