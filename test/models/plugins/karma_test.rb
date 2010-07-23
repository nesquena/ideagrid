require File.expand_path(File.dirname(__FILE__) + '/../../test_config.rb')

context "Karma Plugin" do
  setup do
    @model = mock_model { plugin Plugins::Karma }
  end

  asserts_topic.has_key :karma, Integer, :default => 0

  context "karma methods" do
    setup { @karma = @model.new ; @karma.karma = 1 ; @karma }
    context "add_karma" do
      setup { @karma.add_karma(10) ; @karma }
      asserts(:karma).equals 11
    end
    context "sub_karma" do
      setup { @karma.sub_karma(1) ; @karma }
      asserts(:karma).equals 0
    end
  end


end
