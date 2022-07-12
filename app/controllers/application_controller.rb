class ApplicationController < ActionController::Base

  def create_user
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "User created successfully"
      redirect_to users_path
    else
      render :action => 'new'
    end
  end

end
