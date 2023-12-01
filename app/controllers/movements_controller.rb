class MovementsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]

  def index
    @movements = @category.movements.order(created_at: :desc)
  end

  def show; end

  def new
    @movement = Movement.new
  end

  def edit; end

  def create; end
end
