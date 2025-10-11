class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Ensure user is logged in   
  def require_login
    unless session[:user_id]
      flash[:alert] = "You must be logged in to access that page."
      redirect_to login_path
    end
  end

  # Admin restriction
  def require_admin
    require_login
    unless session[:role] == 'admin'
      flash[:alert] = 'You do not have access to that page.'
      redirect_to root_path
    end
  end

  # Mentor restriction
  def require_mentor
    require_login
    unless session[:role] == 'mentor'
      flash[:alert] = 'Only mentors can perform that action.'
      redirect_to root_path
    end
  end

  # Student restriction
  def require_student
    require_login
    unless session[:role] == 'student'
      flash[:alert] = 'Only students can perform that action.'
      redirect_to root_path
    end
  end
end


