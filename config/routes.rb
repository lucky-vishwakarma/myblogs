Rails.application.routes.draw do

	root :to=> "posts#index"
  	devise_for :users
  	match "/404", :to => "errors#not_found", :via => :all
	match "/500", :to => "errors#internal_server_error", :via => :all


  resources :posts do 
    put :like, on: :member
    put :dislike, on: :member
  	resources :comments do
  		get :new_reply, on: :member
  	end
  	resources :replies, only: [:new, :create]
  end

  resources :users, only: [] do
  	get :myblogs, on: :collection
  end


  
end
