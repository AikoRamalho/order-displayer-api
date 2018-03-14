class User < ApplicationRecord
  has_secure_password


  #Activity Record Association
  has_many :orders, foreign_key: :created_by

  #Validations
  validates_presence_of :name, :email, :password_digest
end
