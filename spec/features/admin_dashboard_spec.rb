require 'rails_helper'

describe 'admin dashboard' do

    it 'redirects to the login page when unauthenticated' do 
        visit admin_root_path
        expect(page).to have_current_path(new_user_session_path)
    end
    
    it 'validates admin user' do
        user = FactoryBot.create(:user)
        login_as(user, :scope => :user)
        visit admin_root_path
        expect(page).to have_current_path(root_path)
    end
    
    it 'can be reached if admin type user' do 
        user = FactoryBot.create(:admin_user)
        login_as(user, :scope => :user)
        visit admin_root_path
        expect(page).to have_current_path(admin_root_path)
    end
end