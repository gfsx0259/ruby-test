class ApplicationController < ActionController::Base
  include CurrentCart
  before_action :set_cart

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  private
  def render_403
    render file: "public/403.html", status: 403
  end

  def render_404
    render file: "public/404.html", status: 404
  end

  def check_if_admin
    render_403 unless current_user
  end
end
