class Pethospital < ApplicationRecord
	belongs_to :hospital
	belongs_to :pet
end
