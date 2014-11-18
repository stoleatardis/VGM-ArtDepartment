class Product < ActiveRecord::Base
	mount_uploader :image, ImageUploader
	belongs_to :category
	validates :name, :description, :price, :stock_quantity, presence: true
	validates :price, numericality: { greater_than_or_equal_to: 0.01 }
	validates :stock_quantity, numericality: { only_integer: true }
end
