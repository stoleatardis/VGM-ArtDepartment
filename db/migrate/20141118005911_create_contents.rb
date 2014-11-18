class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.text :about

      t.timestamps
    end
  end
end
