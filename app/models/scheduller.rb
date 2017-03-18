class Scheduller < ActiveRecord::Base
    belongs_to :company
    belongs_to :agreement
    has_many :clients
end
