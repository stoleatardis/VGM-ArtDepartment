class AddProvinceRefToCustomer < ActiveRecord::Migration
  def change
    add_reference :customers, :province, index: true
  end
end
