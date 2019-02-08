namespace :notification do
  desc "send sms notification to employees asking to log overtime"
  task sms: :environment do
    puts "hello world"
  end

end
