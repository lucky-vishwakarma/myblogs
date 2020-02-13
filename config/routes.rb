Rails.application.routes.draw do
  devise_for :users


  resources :posts do 
  	resources :comments do
  		get :new_reply, on: :member
  	end
  	resources :replies, only: [:new, :create]
  end


  
end
