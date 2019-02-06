require 'rails_helper'

describe 'navigate' do 
    before do 
        @admin_user = FactoryBot.create(:admin_user)
        login_as(@admin_user, :scope => :user)
        @post = FactoryBot.create(:post)
    end
    
    describe 'edit' do 
        it 'has a status that can be edited on the form by the admin' do 
            visit edit_post_path(@post)
            page.choose('post_status_approved')
            click_on "Save"
            expect(@post.reload.approved?).to be(true)
        end
        
        it 'cannot be edited by a non admin' do 
            logout(@admin_user)
            @user = FactoryBot.create(:user)
            login_as(@user, :scope => :user)
            visit edit_post_path(@post)
            expect(page).to_not have_current_path(posts_path)
        end
    end
    
    describe 'approved' do 
        it 'cannot be edited after is approved' do 
            logout(@admin_user)
            @user = FactoryBot.create(:user)
            @post.update(user_id: @user.id, status: 'approved')
            login_as(@user, :scope => :user)
            visit edit_post_path(@post)
            expect(page).to have_current_path(root_path)
        end
    end
end