# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
secret = Rails.env.production? ? ENV['SECRET_TOKEN'] : '58511c3a92eec8ea2ca67b95e1699230bfc0ace8b7f5a70d29cf9bb58eec76709f56f9c042fe678f31322f6c391c52af54cbfd8723e00bbdb0da56046943e6f2'
FlightPlan::Application.config.secret_key_base = secret
