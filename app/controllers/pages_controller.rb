class PagesController < ApplicationController
  def home
  end

  def about
  end

  def legal

  end

  def contact
  end

  def formation
  end

  def start
  end

  def profile
    @user = current_user
  end


end
