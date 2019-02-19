require 'rails_helper'

describe 'homepage' do
    before do 
        @post = FactoryBot.create(:post)
        @admin_user = FactoryBot.create(:admin_user)
        login_as(@admin_user, :scope => :user)
        visit root_path
    end
    
    it 'can approve posts from the homepage' do 
        click_link("approve-#{@post.id}")
        expect(@post.reload.status).to eq('approved')
    end
end