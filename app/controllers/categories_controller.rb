class CategoriesController < ApplicationController

  before_action :set_post, only: [:show, :new, :create, :destroy]

  def show
    @category = Category.find(params[:id])
  end

  def index
    @categories = Category.all
  end

  def create
    @category = @post.categories.new(category_params)
    if @category.save
      redirect_to @post
    else
      render 'categories/show'
    end
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def update
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to post_path(@post)
  end

  private


  def set_post
    @post = Post.find(params[:post_id])
  end

  def category_params
    params.require(:category).permit(:name, :description, :post_id)
  end
end
