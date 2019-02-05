require 'rails_helper'

describe 'navigate posts' do 
    before do
        @user = FactoryBot.create(:user)
        login_as(@user, :scope => :user)
        @post = FactoryBot.create(:post)
        @post.update(user_id: @user.id)
    end
    
    describe 'index' do 
        before do 
            visit posts_path
        end
        
        it 'can be reached' do 
            expect(page.status_code).to be(200)
        end
        
        it 'has "Posts" as title' do 
            expect(page).to have_content(/Posts/)
        end
        
        it 'should display the posts' do 
            expect(page).to have_content(/Some|rationale/)
        end
    end
    
    describe 'new' do 
        it 'has a link from the homepage' do 
            visit root_path
            click_link("new-post-link")
            expect(page.status_code).to be(200)
        end
    end
    
    describe 'creation' do 
        before do 
            visit new_post_path
        end
        
        it 'has a new form that can be reached' do 
            expect(page.status_code).to be(200)
        end 
        
        it 'can be created from new form page' do
            fill_in 'post[date]', with: Date.today
            fill_in 'post[rationale]', with: 'Some rationale'
            click_on "Save"
            expect(Post.last.id).to eq(@user.posts.last.id)
        end
        
        it 'validates presence of user' do
            fill_in 'post[date]', with: Date.today
            fill_in 'post[rationale]', with: "User Association"
            click_on "Save"
            expect(@user.posts.last.rationale).to eq("User Association")
        end
    end
    
    describe 'edit' do 
        it 'can be reached from the edit link in index' do 
            visit posts_path
            click_link("edit-post-#{@post.id}")
            expect(page.status_code).to be(200)
        end
        
        it 'can be modified' do 
            visit edit_post_path(@post.id)
            fill_in 'post[date]', with: Date.yesterday
            fill_in 'post[rationale]', with: "Hello World"
            click_on "Save"
            expect(page).to have_content("Hello World")
        end
    end
    
    describe 'delete' do 
        it 'can be deleted' do 
            visit posts_path
            click_link("delete-post-#{@post.id}")
            expect(page.status_code).to be(200)
        end
    end
    
    describe 'access' do 
        before do 
            logout(:user)
            second_user = FactoryBot.create(:non_authorized_user)
            login_as(second_user,:scope => :user)
        end
        
        it 'individual post visibility is limited to the user creator' do
            visit post_path(@post)
            expect(page).to have_current_path(root_path)
        end
        
        it 'includes only the user posts' do 
            rationale_match = @post.rationale
            visit posts_path
            expect(page).to_not have_content(rationale_match)
        end
        
        it 'cannot be edited by unauthorized user' do 
            visit edit_post_path(@post)
            expect(page).to have_current_path(root_path)
        end
    end
end