class CategoriesController < ApplicationController
  before_action :admin_user, except: %i(show index)
  before_action :load_category, except: %i(create new index)
  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = t ".add_category_success"
      redirect_to categories_path
    else
      render :new
    end
  end

  def show; end

  def index
    @categories = Category.paginate page: params[:page],
      per_page: Settings.app.user.per_page
  end

  def edit; end

  def update
    if @category.update_attributes category_params
      flash[:success] = t ".category_updated"
      redirect_to categories_path
    else
      render :edit
    end
  end

  def destroy
    if @category.destroy
      flash[:success] = t ".category_deleted"
    else
      flash[:danger] = t ".category_delete_error"
    end
    redirect_to categories_path
  end

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
