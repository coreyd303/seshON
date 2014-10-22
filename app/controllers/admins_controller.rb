class AdminsController < ApplicationController
  before_action :authorize?

  private

  def authorize?
    redirect_to root_path unless current_user && current_user.role == "admin"
  end
end
