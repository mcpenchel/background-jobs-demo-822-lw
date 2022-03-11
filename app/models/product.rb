class Product < ApplicationRecord

  # For this particular Business Rule, which is:
  #
  # - Automatically let customers know about a new hot product by e-mail
  # (yes, lame marketing, but we know it happens here and there)
  #
  # You have to consider if:
  #
  # A) You ONLY WANT that to happen after a Product is created through the UI,
  # which means through the browser (by clicking the new btn, filling the form
  # and then clicking the submit btn);
  #
  # OR
  #
  # B) You want that to happen EVERY TIME a Product is created. Be it through
  # the UI (browser), be it after a rails db:seed, be it from inside the `rails c`
  #
  #
  # If you choose A, do it in the *controller*. That's where user action related
  # code should be triggered!
  #
  # If you choose B, do it in a *model callback*. Like this:


  # after_create :notify_users
  #
  # def notify_users
  #   NotifyUsersAboutNewProductJob.perform_later(self)
  # end

end
