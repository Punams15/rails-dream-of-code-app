class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  
  # Admin restriction
  def require_admin
    unless session[:role] == 'admin'
      flash[:alert] = 'You do not have access to that page'
      redirect_to root_path
    end
  end

  # Mentor restriction
  def require_mentor
    unless session[:role] == 'mentor'
      flash[:alert] = 'You do not have access to that page'
      redirect_to root_path
    end
  end

  # Student restriction
  def require_student
    unless session[:role] == 'student'
      flash[:alert] = 'You do not have access to that page'
      redirect_to root_path
    end
  end
end

