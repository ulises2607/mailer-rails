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
    # Verificar que la aplicación esté funcionando
    begin
      # Verificar conexión a la base de datos
      ActiveRecord::Base.connection.execute("SELECT 1")
      
      render json: { 
        status: 'OK', 
        timestamp: Time.current,
        database: 'connected',
        rails_env: Rails.env
      }
    rescue => e
      render json: { 
        status: 'ERROR', 
        timestamp: Time.current,
        error: e.message,
        rails_env: Rails.env
      }, status: :service_unavailable
    end
  end
end