class Content < ActiveRecord::Base
	validates :about, presence: true
end
