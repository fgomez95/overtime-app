require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "Post creation" do 
      before do 
          @post=Post.create!(
              date: Date.current,
              rationale: "Some text"
              )
      end
      it "should be created" do 
          expect(@post).to be_valid
      end
      
      it "should validate presence of date and rationale" do 
          @post.rationale=nil
          @post.date=nil
          expect(@post).to be_invalid
      end
  end
end
