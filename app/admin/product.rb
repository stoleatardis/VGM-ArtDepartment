ActiveAdmin.register Product do

permit_params :name, :description, :price, :stock_quantity, :image, :category_id
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end
form :html => {:multipart => true} do |f|
  f.inputs "Product Details" do
    f.input :name
    f.input :description
    f.input :price
    f.input :stock_quantity
    f.input :category
    f.input :image
  end
  f.actions
end

index do 
  id_column
  column :name
  column :stock_quantity
  actions
end

end
