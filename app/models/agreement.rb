class Agreement < ActiveRecord::Base
  belongs_to :company
  has_many :attendances
  has_many :Schedullers

  validates_presence_of :name , message: "não pode ser em branco!"  
end
