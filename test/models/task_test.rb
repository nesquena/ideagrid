require File.expand_path(File.dirname(__FILE__) + '/../test_config.rb')

context "Task Model" do
  setup { Task.delete_all }
  
  context "definition" do
    setup { Task.make }
    
    asserts_topic.has_key :title,         String
    asserts_topic.has_key :description,   String
    asserts_topic.has_key :frequency,     String
    asserts_topic.has_key :type,          String
    asserts_topic.has_key :people_needed, Integer
  end
end
