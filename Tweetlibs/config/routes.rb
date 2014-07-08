Rails.application.routes.draw do

  # get 'story/show'

  # get 'welcome/index'

  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)

  root :to => 'story#index'
  # post '/', :to => 'story#show'
  # get '/story', :to => 'story#show'

  resources :stories, only: [:index, :show]
    resources :tweets, only: [:index, :show]

end
