Rails.application.routes.draw do
  root 'index#show'
  post '/send_car_data', to: 'index#send_email'
  get '/get_makers', to: 'index#extract_makers'
  get '/get_model', to: 'index#extract_models'
end
