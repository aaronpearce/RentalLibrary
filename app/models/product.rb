class Product < ActiveRecord::Base
	before_validation :dollar_to_cent

	has_attached_file :image, styles: { medium: "300x300>", thumb: "50x50>" }, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

	def dollar_to_cent
		Rails.logger.info self.hirefee
      self.hirefee = self.hirefee * 100.0 
		Rails.logger.info self.hirefee
    end
end