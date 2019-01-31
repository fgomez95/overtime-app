require 'rails_helper'

describe 'navigate' do 
    before do 
        @admin_user = FactoryBot.create(:admin_user)
        login_as(@admin_user, :scope => :user)
    end
    
    describe 'edit' do 
        before do 
            @post = FactoryBot.create(:post)
        end
        
        it 'has a status that can be edited on the form' do 
            visit edit_post_path(@post)
            page.choose('post_status_approved')
            click_on "Save"
            expect(@post.reload.approved?).to be(true)
        end
    end
end