Rails.application.routes.draw do
  root "welcome#home"
  
  namespace :api do
    namespace :v1 do
      resources :dogs
      resources :users
    end
  end
end
