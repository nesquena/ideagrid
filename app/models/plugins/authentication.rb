module Plugins
  module Authentication

    def self.configure(model)
      model.class_eval do
        # fields
        key :email,                 String
        key :crypted_password,      String
        key :salt,                  String
        key :role,                  String
        # callbacks
        before_save :generate_password
        # validations
        validates_presence_of     :email, :role
        validates_presence_of     :password,                   :if => :password_required
        validates_presence_of     :password_confirmation,      :if => :password_required
        validates_length_of       :password, :within => 4..40, :if => :password_required
        validates_confirmation_of :password,                   :if => :password_required
        validates_length_of       :email,    :within => 3..40
        validates_uniqueness_of   :email,    :case_sensitive => false
        validates_format_of       :email,    :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
        validates_format_of       :role,     :with => /[A-Za-z]/
      end
    end

    module ClassMethods
      attr_accessor :password
      attr_accessor :password_confirmation
    end

    module InstanceMethods
      ##
      # This method is for authentication purpose
      #
      def self.authenticate(email, password)
        account = first(:email => email) if email.present?
        account && account.password_clean == password ? account : nil
      end

      ##
      # This method is used to retrieve the original password.
      #
      def password_clean
        crypted_password.decrypt(salt)
      end

      private
      def generate_password
        return if password.blank?
        self.salt = Digest::SHA1.hexdigest("--#{Time.now.to_s}--#{email}--") if new_record?
        self.crypted_password = password.encrypt(self.salt)
      end

      def password_required
        crypted_password.blank? || !password.blank?
      end
    end

  end
end
