source "https://rubygems.org"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 8.0.2"
# Use sqlite3 as the database for Active Record (development only)
# Use postgresql as the database for production
gem "pg", "~> 1.1", group: :production
gem "sqlite3", ">= 2.1", group: [:development, :test]
# Use the Puma web server [https://github.com/puma/puma]
gem "puma", ">= 5.0"

# SMTP configuration for problematic servers
gem "net-smtp", require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin Ajax possible
gem "rack-cors"

# Load environment variables from .env file
gem "dotenv-rails"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"
end
