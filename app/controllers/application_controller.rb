class ApplicationController < ActionController::Base
  #   add a method to return the first user in the database
  def current_user
    @current_user = User.first
  end
end
