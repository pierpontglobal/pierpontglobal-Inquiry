class IndexController < ApplicationController
  def show; end
  def send_email
    puts params
    puts AdminMailer.send_car_user_info params[:name],
                                   params[:surname],
                                   params[:email],
                                   params[:year],
                                   params[:maker],
                                   params[:model]
  end
end
