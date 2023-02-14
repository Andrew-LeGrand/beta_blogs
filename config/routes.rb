Rails.application.routes.draw do
  resources :categories
  root to: "pages#home"
  get '/about-us', to: "pages#about_us"
  resources :blogs
end
