# frozen_string_literal: true

require 'sendgrid-ruby'
class AdminMailer < ApplicationMailer

  def send_car_user_info(name, surname, email, year, maker, model)
    set_client
    data = load_template(name, surname, email, year, maker, model)
    j_data = JSON.parse(data.to_json)
    response = @sg.client.mail._('send').post(request_body: j_data)
    response
  end

  private

  # Fills a json formatted object with the required data to send a confirmation
  # email with the configured template at SendGrid.
  def load_template(name, surname, email, year, maker, model)
    { personalizations: [
      {
        to: [email: 'hector@pierpontglobal.com'],
        dynamic_template_data: {
          first_n: name,
          last_n: surname,
          year: year,
          maker: maker,
          model: model,
          email: email
        }
      }
    ], from: { email: 'support@pierpontglobal.com' },
      template_id: 'd-c56ac8c69ce64a00a740a1d9dc1872fc' }
  end

  protected

  def set_client
    @sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
  end
end
