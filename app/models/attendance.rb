class Attendance < ActiveRecord::Base
  belongs_to :company
  belongs_to :professional
  belongs_to :user
  belongs_to :agreement
  belongs_to :client
end
