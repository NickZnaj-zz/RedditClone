Rails.application.routes.draw do

  resource :user, only: [:new, :create, :edit, :show]
  resource :session, only: [:new, :create, :destroy]

  resources :subs, except: [:destroy] do
    resources :posts, only: [:new, :edit, :create, :update]
  end
  resources :posts, except: [:index, :new, :edit, :create, :update]

end
