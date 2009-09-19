# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_form-builder_session',
  :secret      => '4752a19536e331451109be5110a8ae229b9d47060b8ae719ca39c710ac125c452047b6cc761699429a5d81c29d4387aa548467902ccec8e8ce7414fb94138ccc'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
