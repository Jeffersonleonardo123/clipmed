class Client < ActiveRecord::Base
  belongs_to :company
  belongs_to :professional
  belongs_to :scheduller
  has_many :attendances

  validates_presence_of :name , message: "não pode ser em branco!"
  validates_presence_of :cpf, message: "não pode ser em branco!"
  validates_presence_of :address, message: "não pode ser em branco!"
  validates_presence_of :number, message: "não pode ser em branco!"
  validates_presence_of :neighborhood, message: "não pode ser em branco!"

  # validates_numericality_of :cpf , only_integer: true ,message: "Obrigatorio ser numerico"

end
