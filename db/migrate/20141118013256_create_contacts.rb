class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.string :address
      t.string :city
      t.string :province
      t.string :postalcode

      t.timestamps
    end
  end
end
