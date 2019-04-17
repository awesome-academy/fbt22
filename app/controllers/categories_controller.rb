class CategoriesController < ApplicationController
  before_action :admin_user, except: :show
  before_action :load_category, except: %i(create new)
  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = t ".add_category_success"
      redirect_to root_path
    else
      render :new
    end
  end

  def show; end

  private

  def category_params
    params.require(:category).permit :name
  end

  def load_category
    @category = Category.find_by id: params[:id]
    return if @category
    flash[:danger] = t "categories.action.category_not_found"
    redirect_to :root
  end
end
