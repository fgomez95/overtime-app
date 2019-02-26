require 'rails_helper'

describe 'homepage' do
    describe 'admin' do 
        before do 
            @post = FactoryBot.create(:post)
            @admin_user = FactoryBot.create(:admin_user)
            login_as(@admin_user, :scope => :user)
            visit root_path
        end
        it 'allows the admin to approve posts from the homepage' do 
            click_link("approve-#{@post.id}")
            expect(@post.reload.status).to eq('approved')
        end
    end 
    
    describe 'employee' do
        before do 
            @user = FactoryBot.create(:user)
            login_as(@user, :scope => :user)
            @audit_log = FactoryBot.create(:audit_log)
            @audit_log.update(user_id: @user.id, status: "pending")
            visit root_path
        end
       it 'allows the employee to confirm the audit log' do 
           click_link("confirm-#{@audit_log.id}")
           expect(@audit_log.reload.status).to eq("confirmed")
       end
    end
end