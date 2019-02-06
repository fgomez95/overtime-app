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

20.times do |post|
    User.all.each do |user|
        user.posts.create!(
            date: Date.today, 
            rationale: Faker::Hacker.say_something_smart, 
            overtime_request: Random.rand(0.1..100).truncate(2),
            status: Random.rand(0..2)
        )
    end
end

puts 'posts created'