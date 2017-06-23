Rails.application.routes.draw do

 root 'lenders#new'
 resources :lenders
 resources :borrowers
 resources :histories
 resources :sessions

end
