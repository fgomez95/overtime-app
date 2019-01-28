require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = User.create!(
      first_name:'John', 
      last_name:'Doe', 
      email:'some@email.com', 
      password:'secret', 
      password_confirmation:'secret')
  end
  describe "user creation" do
    it "should be created" do 
        expect(@user).to be_valid
    end
    
    it "should validate presence of first and last name" do 
        @user.first_name=nil
        @user.last_name=nil
        expect(@user).to be_invalid
    end
  end
  
  describe 'custom methods' do 
    it "has a full name method" do 
      expect(@user.full_name).to eq('Doe, John')
    end
  end
end
