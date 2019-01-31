require 'rails_helper'

describe 'navigate' do
    describe 'homepage' do
        before do 
            @admin_user = FactoryBot.create(:admin_user)
            login_as(@admin_user, :scope => :user)
            visit root_path
        end
        
        it 'can be reached' do
            expect(page.status_code).to eq(200)
        end
        
        it 'has a link to the admin dashboard' do
            click_link("admin-dashboard-link")
            expect(page).to have_current_path(admin_root_path)
        end
    end
end