PADRINO_ENV = 'test' unless defined?(PADRINO_ENV)
require File.expand_path(File.dirname(__FILE__) + "/../config/boot")
require File.join(File.dirname(__FILE__),'blueprints')
require 'riot/rr'

# Specify your app using the #app helper inside a context.
# If you don't specify one, Riot::Rack will recursively look for a config.ru file.
# Takes either an app class or a block argument.
# app { Padrino.application }
# app { IdeaGrid.tap { |app| } }

class Riot::Situation
  include Rack::Test::Methods

  # The Rack app under test.
  def app
    IdeaGrid.tap { |app| }
  end

  def mock_model(&block)
    mock = Class.new
    mock.class_eval { include MongoMapper::Document }
    mock.class_eval(&block)
    mock
  end
end

class Riot::Context
  # Set the Rack app which is to be tested.
  #
  #   context "MyApp" do
  #     app { [200, {}, "Hello!"] }
  #     setup { get '/' }
  #     asserts(:status).equals(200)
  #   end
  def app(app=nil, &block)
    setup { @app = (app || block) }
  end
  
end

