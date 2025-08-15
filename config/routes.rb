Rails.application.routes.draw do
  post 'send_mail', to: 'mailer#send_mail'
  get 'health', to: 'mailer#health'
end