class Admin::CategoriesController < Admin::BaseController

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:alert] = "Category created!"
      redirect_to admin_category_path(@category)
    else
      @category.errors.full_messages
      render :new
    end
  end

  def show
    @category = Category.find(params[:id])
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

end