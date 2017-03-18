class Professional < ActiveRecord::Base
  belongs_to :company
  has_many :client
  has_many :attendances
end
