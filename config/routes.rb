Rails.application.routes.draw do
  root 'index#show'
  post '/send_car_data', to: 'index#send_email'
end
