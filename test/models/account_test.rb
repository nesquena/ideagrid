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
        
    asserts_topic.has_validation :validates_presence_of,      :username
    asserts_topic.has_validation :validates_length_of,        :username, :within => 3..40
    asserts_topic.has_validation :validates_length_of,        :first_name, :within => 3..40
    asserts_topic.has_validation :validates_length_of,        :last_name, :within => 3..40
    asserts_topic.has_validation :validates_uniqueness_of,    :username, :case_sensitive => false
  end  
end
