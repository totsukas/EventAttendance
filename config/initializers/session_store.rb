# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_event_session',
  :secret      => '17007e3ea71bef1044e49cb3e2ee312e1dafe52e6bdb77aedd748c46db83cac2a5c1f5621f0a89b7b57d42279b47ef3e73050dae78485b75980d47770214d41b'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
