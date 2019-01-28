user = User.create!(
    first_name: 'John', last_name: 'Doe', 
    email: 'jdoe@fakemail.com', password: 'secret', 
    password_confirmation: 'secret')
100.times do |post|
    user.posts.create!(date: Date.today, rationale:"##{post} rationale")
end
puts 'posts created'