class ProductsController < ApplicationController
  def index
    @products = Product.order('name').page(params[:page]).per(6)
    @categories = Category.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def products_in_category
    @categories = Category.all
    @products = Category.find(params[:id]).products.order('name')
                .page(params[:page]).per(6)
    render :index
  end

  def search_results
    @categories = Category.all
    wildcard_keywords = "%#{params[:keyword_search]}%"
    if params[:category].present?
      @products = Category.find_by_id(params[:category])
                  .products.where('name LIKE ? or description LIKE ?',
                                  wildcard_keywords, wildcard_keywords)
    else
      @products = Product.where('name LIKE ?', wildcard_keywords)
    end
  end

  def add_product_to_cart
    session[:product_in_cart] = params[:id].to_i
    redirect_to :back
  end

  def checkout
  end

  def customer_checkout
    @provinces = Province.all
    @id = Product.find(params[:id].to_i).id
    flash.now[:notice] = 'Purchasing ' + Product.find(@id).name
  end

  def create_customer_invoice
    @new_customer = Customer.create(name: params[:name], email: params[:email],
                                    address: params[:address],
                                    city: params[:city],
                                    province_id: params[:province],
                                    postalcode: params[:postalcode])
    @subtotal = currency(calculate_sub_total)
    @pst = percentage(calculated_pst)
    @gst = percentage(calculated_gst)
    @hst = percentage(calculated_hst)
    @total = currency(calculate_total)
  end

  def purchase_product
    @id = Product.find(session[:product_in_cart]).id
    @current_stock_quantity = Product.find(@id).stock_quantity - 1
    Product.update(@id, stock_quantity: @current_stock_quantity)
    session.delete(:product_in_cart)
  end

  def currency(amount)
    sprintf('$%.2f', amount)
  end

  def percentage(amount)
    sprintf('%.2f%', amount)
  end

  private

  def calculated_pst
    (@new_customer.province.pst / 100) * calculate_sub_total
  end

  def calculated_gst
    (@new_customer.province.gst / 100) * calculate_sub_total
  end

  def calculated_hst
    (@new_customer.province.hst / 100) * calculate_sub_total
  end

  def calculate_total
    calculated_pst + calculated_gst + calculated_hst + calculate_sub_total
  end

  def calculate_sub_total
    @product_in_cart.price
  end
end
