class FavsController < ApplicationController
 def index
    @favs = Fav.where(user: current_user)
  end

  def create
    @post = Post.find(params[:post_id])
    @fav = current_user.favs.where(post: @post).first
    if @fav.present?
      @fav.destroy
    else
      @fav = current_user.favs.new(post: @post)
      if not @post.favs.where(user: current_user).take
        @fav.save
      end
    end
    # redirect_to favs_path
    # redirect_to :back
    respond_to do |format|
      format.js { render :ajax_update_favs }
    end
  end

  def destroy
    @fav = Fav.find(params[:id])
    @fav.destroy
    redirect_to :back
  end
end

