class Prescription < ActiveRecord::Base
  belongs_to :drug
  belongs_to :indication
  belongs_to :dosage
  belongs_to :user
end
