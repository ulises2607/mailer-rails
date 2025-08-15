Rails.application.routes.draw do
  post 'send_mail', to: 'mailer#send_mail'
  get 'health', to: 'mailer#health'
  get '/', to: 'mailer#health'  # Ruta root también para health
end