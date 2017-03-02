class Scheduller < ActiveRecord::Base
    belongs_to :company
    has_many :clients
end
