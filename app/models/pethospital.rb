class Pethospital < ApplicationRecord
	belongs_to :hospital
	belongs_to :pet, optional: true
	belongs_to :day, optional: true
end
