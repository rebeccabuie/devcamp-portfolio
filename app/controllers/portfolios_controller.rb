class PortfoliosController < ApplicationController
  def index
    @portfolio_items = Portfolio.all
  end

  def angular
    @angular_portfolio_items = Portfolio.angular
  end

  def new
    @portfolio_item = Portfolio.new
    3.times { @portfolio_item.technologies.build}
  end

  def create
    @portfolio_item = Portfolio.new(params.require(:portfolio).permit(:title, :subtitle, :body, technologies_attributes: [:name]))

  
      if @portfolio_item.save
        redirect_to portfolios_path, notice: "Portfolio item was successfully created."
      else
        render :new
      end
  end

    def show
      @portfolio_item = Portfolio.find(params[:id])
    end

    def edit
      @portfolio_item = Portfolio.find(params[:id])
    end

    def update
     @portfolio_item = Portfolio.find(params[:id])

       respond_to do |format|
         if @portfolio_item.update(params.require(:portfolio).permit(:title, :subtitle, :body))
           format.html { redirect_to portfolios_path, notice: 'The record successfully updated.' }
         else
           format.html { render :edit }
         end
       end
     end

    def destroy
      @portfolio_item = Portfolio.find(params[:id])
      @portfolio_item.destroy
      redirect_to portfolios_path
    end

    private

    def portfolio_params
      params.require(:portfolio).permit(:title, :subtitle, :body, :thumb_image, :main_image)
    end

end




