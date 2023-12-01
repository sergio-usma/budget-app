class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def edit; end

  def create
    @category = current_user.categories.build(category_params)

    if @category.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
