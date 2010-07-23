require File.expand_path(File.dirname(__FILE__) + '/../test_config.rb')

context "Account Model" do
  setup { Account.delete_all }
  
  context 'definition' do
    setup { Account }
    
    asserts_topic.has_plugin Plugins::Karma
    asserts_topic.has_plugin Plugins::Authentication
    
    asserts_topic.has_key :first_name,        String
    asserts_topic.has_key :last_name,         String
    asserts_topic.has_key :username,          String
    asserts_topic.has_key :crypted_password,  String
    asserts_topic.has_key :email,             String
    asserts_topic.has_key :salt,              String
    asserts_topic.has_key :role,              String
    asserts_topic.has_key :karma,             Integer, :default => 0
    
    asserts_topic.responds_to :password
    asserts_topic.responds_to :password_confirmation
    
    asserts_topic.has_validation :validates_presence_of,      :email
    asserts_topic.has_validation :validates_presence_of,      :role
    asserts_topic.has_validation :validates_presence_of,      :username
    asserts_topic.has_validation :validates_presence_of,      :password, :if => :password_required
    asserts_topic.has_validation :validates_presence_of,      :password_confirmation, :if => :password_required
    asserts_topic.has_validation :validates_length_of,        :password, :within => 4..40, :if => :password_required
    asserts_topic.has_validation :validates_confirmation_of,  :password,                   :if => :password_required
    asserts_topic.has_validation :validates_length_of,        :email,    :within => 3..40
    asserts_topic.has_validation :validates_length_of,        :username, :within => 3..40
    asserts_topic.has_validation :validates_length_of,        :first_name, :within => 3..40
    asserts_topic.has_validation :validates_length_of,        :last_name, :within => 3..40
    asserts_topic.has_validation :validates_uniqueness_of,    :email, :case_sensitive => false
    asserts_topic.has_validation :validates_uniqueness_of,    :username, :case_sensitive => false
    asserts_topic.has_validation :validates_format_of,        :email,    :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
    asserts_topic.has_validation :validates_format_of,        :role,     :with => /[A-Za-z]/
  end
  
  context "karma methods" do
    setup { @account = Account.make :karma => 1 }
    
    context "add_karma" do
      setup { @account.add_karma(10) ; @account }
      asserts(:karma).equals 11
    end
    
    context "sub_karma" do
      setup { @account.sub_karma(1) ; @account }
      asserts(:karma).equals 0
    end
  end
  
  
end
