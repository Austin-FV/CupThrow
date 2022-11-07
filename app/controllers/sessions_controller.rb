class SessionsController < ApplicationController
  
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
      log_in user
      redirect_to user
    elsif !user 
      # Create an error message.
      flash.now[:danger] = 'User does not exist, you must sign up first!' 
      render 'new'
    else 
      # Create an error message.
      flash.now[:danger] = 'Incorrect password, please try again!' 
      render 'new'
    end
  end


  def destroy
    log_out
    redirect_to root_url
  end
end
