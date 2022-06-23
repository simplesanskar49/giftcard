class SessionsController < ApplicationController
  def new
    # No need for anything in here, we are just going to render our
    # new.html.erb AKA the login page
  end

  def create
    # Look up User in db by the email address submitted to the login form and
    # convert to lowercase to match email in db in case they had caps lock on:
    user = User.find_by(username: params[:login][:username].downcase)

    # Verify user exists in db and run has_secure_password's .authenticate()
    # method to see if the password submitted on the login form was correct:
    if user && user.authenticate(params[:login][:password]) && user.role == 0
      # Save the user.id in that user's session cookie:
      session[:user_id] = user.id.to_s
      redirect_to orders_home_path, notice: 'Successfully logged in! as User'

    elsif user && user.authenticate(params[:login][:password]) && user.role == 1
        # Save the user.id in that user's session cookie:
        session[:user_id] = user.id.to_s
        redirect_to admin_history_path, notice: 'Successfully logged in! as admin'

    else
      # if email or password incorrect, re-render login page:
      flash.now.alert = "Incorrect email or password, try again."
      render :new
    end
  end

  def destroy
    # delete the saved user_id key/value from the cookie:
    session.delete(:user_id)
    redirect_to login_path, notice: "Logged out!"
  end
end
