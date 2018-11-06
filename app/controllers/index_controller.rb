class IndexController < ApplicationController
  skip_before_action :verify_authenticity_token

  def show;
  end

  def extract_makers
    render json: Maker.all.map(&:title), status: :ok
  end

  def extract_models
    maker = Maker.find_by_title params[:maker]
    render json: Model.where(maker_id: maker.id, year: params[:year]).map(&:title), status: :ok
  end

  def send_email
    puts params
    puts AdminMailer.send_car_user_info params[:name],
                                        params[:surname],
                                        params[:email],
                                        params[:year],
                                        params[:maker],
                                        params[:model],
                                        params[:phone_number]
  end
end
