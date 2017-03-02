class Company < ActiveRecord::Base
  has_many :clients
  has_many :professionals
  has_many :users
  has_many :agreements
  has_many :schedullers
end
