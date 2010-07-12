require File.expand_path(File.dirname(__FILE__) + '/../test_config.rb')

context "Problem Model" do
  setup { Problem.delete_all }
  context "definition" do
    setup { Problem.make }
    asserts_topic.has_key :title, String
    asserts_topic.has_key :description, String
  end
end
