class ApplicationController < ActionController::Base
  #before_action :login?
  helper_method :current_user, :require_user, :logged_in?
  #before_action :current_user, :require_user, :logged_in?

  def current_user
    if session[:usuario_id]
      @current_user ||= Usuario.where(id: session[:usuario_id]).first
    end
  end

  def logged_in?
    !!current_user
  end

  def require_user
    unless logged_in?
      flash[:alert] = 'Debes iniciar sesion'
      redirect_to root_path
    end
  end

  #Metodo para desactivar el navbar
  def disable_nav
    @disable_nav = true
  end

end
