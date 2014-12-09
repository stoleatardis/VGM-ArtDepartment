class Contact < ActiveRecord::Base
  validates :name, :email, :address, :city, :province, :postalcode,
            presence: true
end
