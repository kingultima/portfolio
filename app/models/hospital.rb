class Hospital < ApplicationRecord

	before_save do
		self.day.gsub!(/[\[\]\"]/, "") if attribute_present?("day")
		self.pet.gsub!(/[\[\]\"]/, "") if attribute_present?("pet")
	end

	geocoded_by :address
	after_validation :geocode, if: :address_changed?

	validates :name, presence: true
	validates :address, presence: true
	validates :tel, presence: true
	validates :caption, presence: true, length: { maximum: 200 }
	validates :description, presence: true
	validates :pet, presence: true
	validates :day, presence: true
	# 国内プレフィックス(0)と市外局番(1～4) – 市内局番(1～4) – 加入者番号(4)
	# ハイフンはありでもなしでも可。全体の桁数チェックは無し
	VALID_PHONE_REGEX = /\A(0{1}\d{1,4}-{0,1}\d{1,4}-{0,1}\d{4})\z/
	validates :tel, presence: true, format: { with: VALID_PHONE_REGEX }

	private

	def before_validations
    # telの文字列から先頭と末尾のスペースを除去する
    tel.strip!
	end
end
