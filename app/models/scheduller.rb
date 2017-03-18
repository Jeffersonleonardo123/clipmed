class Scheduller < ActiveRecord::Base
    belongs_to :company
    belongs_to :agreement
    has_many :clients

    validates_presence_of :professional_id , message: "não pode ser em branco!"
    validates_presence_of :time_marked, message: "não pode ser em branco!"
    validates_presence_of :date, message: "não pode ser em branco!"
    validates_presence_of :name, message: "não pode ser em branco!"
    validates_presence_of :agreement_id, message: "não pode ser em branco!"

end
