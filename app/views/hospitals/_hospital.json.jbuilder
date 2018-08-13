json.extract! hospital, :id, :name, :caption, :description, :address, :latitude, :longitude, :tel, :time_id, :hospital_image, :pet, :tag, :created_at, :updated_at
json.url hospital_url(hospital, format: :json)
