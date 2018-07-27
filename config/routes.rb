Rails.application.routes.draw do
  resources :users, only: [:create, :show, :edit, :update]
  get "/users/:id/profile_pic" => "users#profilePic", as: "profile_pic_upload"
  put "/users/:id/profile_pic" => "users#profilePic_update"
  resources :uploads, only: [:index, :show]
  resources :challenges, only: [:index, :new, :create, :edit, :update] do
    resources :uploads, only: [:new, :create]
  end

  # from clearance
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users, controller: "users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  # end
  
  root "homepage#index"
end
