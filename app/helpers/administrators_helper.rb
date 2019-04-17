module AdministratorsHelper
  # Confirms an admin user.
  def admin_user
    redirect_to root_path unless current_user.role == Settings.app.user.admin
  end
end
