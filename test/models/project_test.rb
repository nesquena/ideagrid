require File.expand_path(File.dirname(__FILE__) + '/../test_config.rb')

context "Project Model" do
  setup { Project.delete_all }
  
  context "definition" do
    setup { Project.make }
    asserts_topic.has_key :title, String
    asserts_topic.has_key :description, String
  end
end
