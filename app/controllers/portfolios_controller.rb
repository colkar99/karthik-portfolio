class PortfoliosController < ApplicationController

	def index
		@portfolio_items = Portfolio.all

	end
	def angular
		@angular_portfolio_item = Portfolio.angular
	end
	def new
		@portfolio_items = Portfolio.new
	end
	def create
    	@portfolio_item = Portfolio.new(params.require(:portfolio).permit(:title,:subtitle, :body))

	    respond_to do |format|
	      if @portfolio_item .save
	        format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully created.' }
	        # format.json { render :show, status: :created, location: @blog }
	      else
	        format.html { render :new }
	        # format.json { render json: @blog.errors, status: :unprocessable_entity }
	      end
	    end
  	end
  	def edit
  		@portfolio_items = Portfolio.find(params[:id])
  	end
  	def update
  		@portfolio_items = Portfolio.find(params[:id])
	    respond_to do |format|
	      if @portfolio_items.update(params.require(:portfolio).permit(:title,:subtitle, :body))
	        format.html { redirect_to portfolios_path, notice: 'Blog was successfully updated.' }
	        format.json { render :show, status: :ok, location: @blog }
	      else
	        format.html { render :edit }
	        # format.json { render json: @portfolio_items.errors, status: :unprocessable_entity }
	      end
	    end
  	end
  	def show
  		#perform the lookup
  		@portfolio_item = Portfolio.find(params[:id])
  	end
  	def destroy
  		@portfolio_item = Portfolio.find(params[:id])
    	@portfolio_item.destroy
    		respond_to do |format|
      		format.html { redirect_to portfolios_path, notice: 'Blog was successfully destroyed.' }
      		# format.json { head :no_content }
    	end
  	end
end
