class FakeJob < ApplicationJob
  queue_as :default

  def perform
    puts "Starting some time consuming job..."
    sleep 5
    puts "Finished the time consuming job"
  end
end
