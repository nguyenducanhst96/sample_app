class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by email: params[:session][:email].downcase
    if user &. authenticate params[:session][:password]
      log_in user
      remember_or_forget user
      redirect_back_or user
    else
      flash.now[:danger] = t ".content_danger"
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
