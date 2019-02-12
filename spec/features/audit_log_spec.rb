require 'rails_helper'

describe 'Audit Feature' do 
    before do 
        @audit_log = FactoryBot.create(:audit_log)
        @admin_user = FactoryBot.create(:admin_user)
        login_as(@admin_user, :scope => :user)
    end
    
    describe 'navigation link' do 
        it 'has a link for admin users' do 
            visit root_path
            expect(page).to have_content(/Audit Log/)
        end
        
        it 'should not display audit log link to regular users' do 
            logout
            @user = FactoryBot.create(:user)
            login_as(@user, :scope => :user)
            visit root_path
            expect(page).to_not have_content(/Audit Log/)
        end
        
        it 'should not allow access to non admin users' do 
            logout
            @user = FactoryBot.create(:user)
            login_as(@user, :scope => :user)
            visit audit_logs_path
            expect(page).to have_current_path(root_path)
        end
    end
    
    describe 'index' do 
        before do 
            visit audit_logs_path
        end
        
        it 'can be reached' do 
            expect(page.status_code).to eq(200)
        end
        
        it 'display audit log records' do 
            expect(page).to have_content(@audit_log.user.full_name)
        end
    end
end