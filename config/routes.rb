Rails.application.routes.draw do
  # get '/' => 'user#registration'
  root 'user#registration'
  post '/confirmation' => 'user#confirmation'
  post '/password_match' => 'user#password_match'
  get '/reginfo' => 'user#reginfo'
  post '/addphonenum' => 'user#addphonenum'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root 'user_controller#registration'
end
