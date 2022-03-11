class UpdateUserJob < ApplicationJob
  queue_as :default

  # Before Rails 5, Sidekiq was not able to receive a complex instance
  # like an user instance as a parameter.
  #
  # So we would need instead to do something like this:
  # def perform(user_id)
  #   user = User.find(user_id)
  #   ...
  # end
  #
  # But we're after rails 5 :D So now we *can* send a complex instance
  # like the user's normally.

  def perform(user)
    puts "Calling Clearbit API for #{user.email}..."
    # TODO: perform a time consuming task like Clearbit's Enrichment API.
    sleep 5
    puts "Done! Enriched #{user.email} with Clearbit"
  end
end
