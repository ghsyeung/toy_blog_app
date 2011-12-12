class Person
  include Mongoid::Document
  include ActiveModel::SecurePassword
  #include ActiveModel::Validations

  field :user_name, :type => String
  field :email, :type => String
  field :password_digest, :type => String

  has_secure_password

  validates_presence_of :password, :on => :create
  validates_presence_of :user_name, :email
  validates_format_of :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i
  validates_format_of :user_name, :with => /^\w{4,16}$/i
end
