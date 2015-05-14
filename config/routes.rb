Rails.application.routes.draw do

  # This line mounts Forem's routes at /forums by default.
  # This means, any requests to the /forums URL of your application will go to Forem::ForumsController#index.
  # If you would like to change where this extension is mounted, simply change the :at option to something different.
  #
  # We ask that you don't use the :as option here, as Forem relies on it being the default of "forem"
  # mount Forem::Engine, :at => '/forums'


  devise_for :users

  resources :victims

  resources :links do
    member do
      put 'upvote', to: 'links#upvote'
      put 'downvote', to: 'links#downvote'
    end
  end

  namespace :admin do
    get '', to: 'dashboard#index', as: '/'
  end

  root 'victims#index'

end
