module Plugins
  module Karma

    def self.configure(model)
      model.key :karma, Integer, :default => 0
    end

    module ClassMethods
    end

    module InstanceMethods
      def add_karma(points=1)
        self.update_attributes :karma => self.karma + points
      end

      def sub_karma(points=1)
        self.update_attributes :karma => self.karma - points
      end
    end

  end
end
