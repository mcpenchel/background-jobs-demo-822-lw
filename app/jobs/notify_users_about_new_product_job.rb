class NotifyUsersAboutNewProductJob < ApplicationJob
  queue_as :default # you can change the queue in here!

  def perform(product)
    puts "Sending new Product #{product.title} information to all users in the DB..."

    # In real life we would have something like:
    #
    # ProductMailer.announce_launch(product).deliver_later
    #
    # To pretend we're doing something like that, we let Rails sleep for
    # some time:
    sleep 10

    puts "Finished sending all the emails"
  end
end
