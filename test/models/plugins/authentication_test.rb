require File.expand_path(File.dirname(__FILE__) + '/../../test_config.rb')

context "Authentication Plugin" do

  context 'definition' do
    setup do
      mock_model { plugin Plugins::Authentication }
    end

    asserts_topic.has_key :crypted_password,  String
    asserts_topic.has_key :email,             String
    asserts_topic.has_key :salt,              String
    asserts_topic.has_key :role,              String

    asserts_topic.responds_to :password
    asserts_topic.responds_to :password_confirmation

    asserts_topic.has_validation :validates_presence_of,      :email
    asserts_topic.has_validation :validates_presence_of,      :role
    asserts_topic.has_validation :validates_presence_of,      :password, :if => :password_required
    asserts_topic.has_validation :validates_presence_of,      :password_confirmation, :if => :password_required
    asserts_topic.has_validation :validates_length_of,        :password, :within => 4..40, :if => :password_required
    asserts_topic.has_validation :validates_confirmation_of,  :password,                   :if => :password_required
    asserts_topic.has_validation :validates_length_of,        :email,    :within => 3..40
    asserts_topic.has_validation :validates_uniqueness_of,    :email, :case_sensitive => false
    asserts_topic.has_validation :validates_format_of,        :email,    :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
    asserts_topic.has_validation :validates_format_of,        :role,     :with => /[A-Za-z]/
  end
end
