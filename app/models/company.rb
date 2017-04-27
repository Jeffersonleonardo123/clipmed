class Company < ActiveRecord::Base
  has_many :clients
  has_many :professionals
  has_many :users
  has_many :agreements
  has_many :card_operators  
  has_many :schedullers
  has_many :attendances

  validates_presence_of :name , message: "não pode ser em branco!"
end
