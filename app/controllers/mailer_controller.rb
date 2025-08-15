class MailerController < ApplicationController
  def send_mail
    begin
      # Leer el body completo como string
      raw_body = request.raw_post.force_encoding('UTF-8')
      data = JSON.parse(raw_body)
      
      UserMailer.send_mail(
        data['to'] || 'tecnico@institutosancayetanosalta.com',
        data['subject'] || 'Nueva inscripción recibida',
        data
      ).deliver_now
      
      render json: { status: 'Email sent successfully', message: 'Correo enviado exitosamente' }
    rescue JSON::ParserError => e
      render json: { error: "JSON inválido: #{e.message}" }, status: :bad_request
    rescue => e
      render json: { error: "Error: #{e.message}" }, status: :internal_server_error
    end
  end

  def health
    # Healthcheck simple sin dependencias
    render json: { 
      status: 'OK', 
      timestamp: Time.current,
      rails_env: Rails.env,
      port: ENV['PORT'] || '3000'
    }
  end
end