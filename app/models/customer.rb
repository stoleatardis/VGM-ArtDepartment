class Customer < ActiveRecord::Base
	belongs_to :province
	validates :name, :province, :email, :address, :city, :postalcode, presence: true
end
