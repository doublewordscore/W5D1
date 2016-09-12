Rails.application.routes.draw do
  resources :users do
    resources :activities, only: [:new, :create, :edit, :update, :delete]
  end

  resource :session
  resources :activities, only: [:index, :show]
end
