class Agreement < ActiveRecord::Base
  belongs_to :company
  has_many :attendances
  has_many :Schedullers
end
