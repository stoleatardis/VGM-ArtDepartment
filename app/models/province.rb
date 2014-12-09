class Province < ActiveRecord::Base
	has_many :customers
	validates :name, :pst, :gst, :hst, presence: true
	validates :pst, :gst, :hst, numericality: { only_decimal: true }
end
