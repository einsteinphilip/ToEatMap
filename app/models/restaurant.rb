class Restaurant < ActiveRecord::Base
	belongs_to :user
	acts_as_taggable # Alias for acts_as_taggable_on :tags
  	acts_as_taggable_on :tags
	ratyrate_rateable "score"
	geocoded_by :address
	after_validation :geocode
	after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }
end
