class ProductsController < ApplicationController

	before_action :set_product, only: [:show, :edit, :update, :destroy]

  	def index
    	@products = Product.all
  	end

  	def show
  	end

  	def new
    	@product = Product.new
  	end

  	def create
    	@product = Product.new(product_params)
    	if @product.save
      		redirect_to products_path, notice: "Successfully Created"
    	else
      		flash[:error] =  @product.errors.full_messages.to_sentence
      		render action: 'new'
    	end
  	end
  
 	 def edit
    	@page_title = t('product.edit', product_name: @product.name)
  	end

  	def update
    	if @product.update(product_params)
      		respond_to do |format|
        		format.html { redirect_to product_path(@product), notice: "Successfully Updated" }
        		format.json { render json: { success: true } }
      		end
    	else
      		flash[:error] = @product.errors.full_messages.to_sentence
      		render action: 'edit'
		end
  	end 

  	def destroy
    	@product.destroy
   	 	redirect_to products_path()
  	end

  	private

  	def set_product
   	 	@product = Product.find(params[:id])
  	end

  	def product_params
   		params.require(:product).permit(:name, :description, :rented, :hirefee, :image)
  	end
end