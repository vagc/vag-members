Rails.application.routes.draw do
  resources :stickers
  resources :members
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "stickers#email"
  get "/import" => "members#import_members"
  get "/sticker" => "stickers#email"
  post "/get_email" => "stickers#get_email"
  get "/number" => "stickers#number"
  post "/get_number" => "stickers#get_number"
  get "/choose" => "stickers#choose"
  post "/confirm" => "stickers#confirm"
  get "/refresh" => "stickers#refresh"
  get "/export" => "stickers#export"
  get "/view69" => "stickers#view"
  post "/logout" => "stickers#reset_session_and_redirect"
end
