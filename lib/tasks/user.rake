namespace :user do
  desc "This task will enrich all the users in our database"
  task update_all: :environment do
    User.all.each do |user|
      UpdateUserJob.perform_later(user)
    end
  end


  # rails user:update[666]

  desc "Enriching a given user with Clearbit (sync)"
  task :update, [:user_id] => :environment do |t, args|
    user = User.find(args[:user_id])
    puts "Enriching #{user.email}..."
    UpdateUserJob.perform_later(user)
    # rake task will return when job is _done_
  end
end
