class MovementsController < ApplicationController
  before_action :set_category, only: %i[index show new create edit update destroy]
  before_action :authenticate_user!, except: %i[index show]

  def index
    redirect_to categories_path unless @category.user == current_user
    @movements = @category.movements.order(created_at: :desc)
    @total_amount = @movements.sum(:amount)
  end

  def sum
    @total_amount = @category.movements.sum(:amount)
  end
  helper_method :sum

  def show; end

  def new
    @movement = Movement.new
    @categories = current_user.categories.order(name: :asc)
  end

  def edit; end

  def create
    @movement = current_user.movements.build(movement_params)

    if @movement.save
      redirect_to category_movements_path(@category)
    else
      @categories = current_user.categories.order(name: :asc)
      render :new, status: :unprocessable_entity
    end
  end

  def update; end

  def destroy; end

  private

  def set_category
    @category = Category.find(params[:category_id])
  rescue ActiveRecord::RecordNotFound
    redirect_to categories_path
  end

  def movement_params
    params.require(:movement).permit(:amount, :name, :category_ids)
  end
end
