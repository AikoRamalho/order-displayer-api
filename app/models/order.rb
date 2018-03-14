class Order < ApplicationRecord
  validates_presence_of :password
  validates_presence_of :created_by
end
