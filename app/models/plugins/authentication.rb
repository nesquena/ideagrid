module Plugins
  module Authentication

    def self.configure(model)
      # fields
      model.key :email,                 String
      model.key :crypted_password,      String
      model.key :salt,                  String
      model.key :role,                  String
      # callbacks
      model.before_save :generate_password
      # validations
      model.validates_presence_of     :email, :role
      model.validates_presence_of     :password,                   :if => :password_required
      model.validates_presence_of     :password_confirmation,      :if => :password_required
      model.validates_length_of       :password, :within => 4..40, :if => :password_required
      model.validates_confirmation_of :password,                   :if => :password_required
      model.validates_length_of       :email,    :within => 3..40
      model.validates_uniqueness_of   :email,    :case_sensitive => false
      model.validates_format_of       :email,    :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
      model.validates_format_of       :role,     :with => /[A-Za-z]/
    end

    module ClassMethods
      attr_accessor :password
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
