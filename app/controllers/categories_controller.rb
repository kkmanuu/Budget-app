class CategoriesController < ApplicationController
  before_action :authenticate_user!, except: [:splash]

  ICON_OPTIONS = ['🍔', '🛒', '🚗', '🐶', '📚', '💻', '🎁', '🏠', '🏥', '🎬', '👔', '🎓'].freeze

  def index
    @categories = current_user.categories.includes(:expenses)
  end

  def new
    @category = Category.new
    @options = ICON_OPTIONS
  end

  def create
    icon = categories_params[:icon].presence || ICON_OPTIONS.first

    @category = current_user.categories.build(categories_params.merge(icon:))

    if @category.save
      redirect_to categories_path, notice: 'Expense category was successfully created.'
    else
      flash.now[:alert] = 'Try again. Cannot create a new expense category.'
      render :new
    end
  end

  def splash; end

  def destroy
    @category = current_user.categories.find(params[:id])
    @category.destroy
    redirect_to categories_path, alert: 'Expense category deleted successfully.'
  end

  private

  def categories_params
    params.require(:category).permit(:name, :icon).merge(user_id: current_user.id)
  end
end
