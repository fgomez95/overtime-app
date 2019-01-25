require 'rails_helper'

describe 'navigate' do 
    describe 'index' do 
        before do
            visit posts_path
        end
            
        it 'can be reached' do 
            expect(page.status_code).to be(200)
        end
        
        it 'has a "posts" as title' do 
            expect(page).to have_content(/Posts/)
        end
        
    end
    
    describe 'creation' do 
        before do 
            user = User.create!(
                first_name:'John', 
                last_name:'Doe', 
                email:'some@email.com', 
                password:'secret', 
                password_confirmation:'secret')
            login_as(user, :scope => :user)
            visit new_post_path
        end
        
        it 'has a new form that can be reached' do 
            expect(page.status_code).to be(200)
        end 
        
        it 'can be created from new form page' do
            fill_in 'post[date]', with: Date.today
            fill_in 'post[rationale]', with: 'Some rationale'
            click_on "Save"
            expect(page).to have_content('Some rationale')
        end
        
        it 'will have a user associated it' do
            fill_in 'post[date]', with: Date.today
            fill_in 'post[rationale]', with: "User Association"
            click_on "Save"
            expect(User.last.posts.last.rationale).to eq("User Association")
        end
    end
end