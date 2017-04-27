class CardOperator < ActiveRecord::Base
  belongs_to :company
  
  validates_presence_of :name , message: "não pode ser em branco!"      
end
