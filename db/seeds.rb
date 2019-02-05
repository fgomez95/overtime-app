if user = User.create!(
    first_name: 'John', 
    last_name: 'Doe', 
    email: 'jdoe@fakemail.com', 
    password: 'secret', 
    password_confirmation: 'secret')
    puts 'user created'
end

if unauthorized_user = User.create!(
    first_name: 'Not', 
    last_name: 'Authorized',
    email: 'unauthorized@fakemail.com',
    password: 'secret',
    password_confirmation: 'secret'
    )
    puts 'unauthorized user created'
end

if admin_user = AdminUser.create!(
    first_name: 'D', 
    last_name: 'Administrator', 
    email: 'dadmin@pimpmail.com', 
    password: 'secret', 
    password_confirmation: 'secret')
    puts 'admin created'
end

100.times do |post|
    user.posts.create!(date: Date.today, rationale:"##{post} rationale")
    unauthorized_user.posts.create!(date: Date.today, rationale:"#{post}. unauthorized user post")
end
puts 'posts created'