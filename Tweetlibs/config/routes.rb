Rails.application.routes.draw do

  # get 'story/show'

  # get 'welcome/index'

  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)

  root :to => 'story#index'
  # post '/', :to => 'story#show'
  # get '/story', :to => 'story#show'

  resources :story, only: [:index, :create, :show, :destroy] do
    resources :tweet, only: [:index, :show, :create, :update]
  end

end
