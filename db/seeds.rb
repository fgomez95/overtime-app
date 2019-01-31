if user = User.create!(
    first_name: 'John', last_name: 'Doe', 
    email: 'jdoe@fakemail.com', password: 'secret', 
    password_confirmation: 'secret')
    puts 'user created'
end
if admin_user = AdminUser.create!(
    first_name: 'D', last_name: 'Administrator', 
    email: 'dadmin@pimpmail.com', password: 'secret', 
    password_confirmation: 'secret')
    puts 'admin created'
end

100.times do |post|
    user.posts.create!(date: Date.today, rationale:"##{post} rationale")
end
puts 'posts created'