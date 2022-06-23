class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.role = 0

    # store all emails in lowercase to avoid duplicates and case-sensitive login errors:
    @user.username.downcase!

    if @user.save
      # If user saves in the db successfully:
      flash[:notice] = "Account created successfully!"
      redirect_to login_path
    else
      # If user fails model validation - probably a bad password or duplicate email:
      flash.now.alert = "Oops, couldn't create account. Please make sure you are using a valid email and password and try again."
      render :new
    end
  end

  private

  def user_params
    # strong parameters - whitelist of allowed fields #=> permit(:name, :email, ...)
    # that can be submitted by a form to the user model #=> require(:user)
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :role)
  end

end
