class UsersController < ApplicationController
  before_filter :authenticate_user!

  def show
    @user = current_user

    respond_to do |format|
      format.html
      format.xml { render :xml => @user }
    end
  end
end
