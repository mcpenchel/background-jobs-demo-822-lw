Rails.application.routes.draw do
  # If you're wondering what's a products resource doing here,
  # it's just to showcase an example of how to trigger a background job from
  # the Controller layer.
  resources :products

  devise_for :users
  root to: 'pages#home'

  # Sidekiq Web UI, only for admins.
  require "sidekiq/web"
  # In case you want to investigate a little bit about this weird syntax,
  # check this out: https://www.rubyguides.com/2016/02/ruby-procs-and-lambdas/
  authenticate :user, ->(user) { user.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end
end
