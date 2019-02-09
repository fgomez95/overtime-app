if user = User.create!(
    first_name: 'John', 
    last_name: 'Doe', 
    email: 'jdoe@fakemail.com', 
    password: 'secret', 
    password_confirmation: 'secret',
    phone_number: '55544412'
    )
    puts 'user created'
end

if unauthorized_user = User.create!(
    first_name: 'Not', 
    last_name: 'Authorized',
    email: 'unauthorized@fakemail.com',
    password: 'secret',
    password_confirmation: 'secret',
    phone_number: '55544412'
    )
    puts 'unauthorized user created'
end

if admin_user = AdminUser.create!(
    first_name: 'D', 
    last_name: 'Administrator', 
    email: 'dadmin@pimpmail.com', 
    password: 'secret', 
    password_confirmation: 'secret',
    phone_number: '55544412'
    )
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
        user.audit_logs.create!(
            start_date: Date.today - Random.rand(5..7),
            end_date: Date.today + Random.rand(1..5),
            )
    end
end

puts 'posts and logs created'