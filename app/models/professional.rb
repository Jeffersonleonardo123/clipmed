class Professional < ActiveRecord::Base
  belongs_to :company
  has_many :client
  has_many :attendances

  validates_presence_of :name , message: "não pode ser em branco!"
  validates_presence_of :cpf, message: "não pode ser em branco!"
  validates_presence_of :address, message: "não pode ser em branco!"
  validates_presence_of :number, message: "não pode ser em branco!"
  validates_presence_of :neighborhood, message: "não pode ser em branco!"
end
