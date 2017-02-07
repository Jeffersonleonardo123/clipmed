class Company < ActiveRecord::Base
  has_many :clients
  has_many :professionals
  has_many :users
  has_many :agreements
end
