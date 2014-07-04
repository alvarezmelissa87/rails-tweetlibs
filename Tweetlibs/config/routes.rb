Rails.application.routes.draw do

  # get 'story/show'

  # get 'welcome/index'

  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)

  root :to => 'welcome#index'
  post '/', :to => 'story#show'
  get '/story', :to => 'story#show'
  # get 'graduates/search', :to => 'graduates#search'
  # get 'graduates/locations', :to => 'graduates#locations'
  # get 'graduates/by_location', :to => 'graduates#by_location'
  # post 'graduates/mail', to: 'graduates#email'

  # get 'graduates/update', to: 'graduates#update'
end
