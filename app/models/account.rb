require 'digest/sha1'

class Account
  include MongoMapper::Document
  plugin Plugins::Karma
  plugin Plugins::Authentication

  # Keys
  key :first_name,            String
  key :last_name,             String
  key :username,              String

  # Validations
  validates_presence_of     :username
  validates_length_of       :username, :within => 3..40
  validates_length_of       :first_name, :within => 3..40
  validates_length_of       :last_name, :within => 3..40
  validates_uniqueness_of   :username, :case_sensitive => false  
end