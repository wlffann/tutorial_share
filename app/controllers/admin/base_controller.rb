class Admin::BaseController < ApplicationController

  before_action :require_admin

  def require_admin
    render "admin/shared/not_authorized" unless current_admin?
  end

end