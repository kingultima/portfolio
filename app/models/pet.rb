class Pet < ApplicationRecord
	has_many :pethospitals
	has_many :hospitals, :through => :pethospitals
end
