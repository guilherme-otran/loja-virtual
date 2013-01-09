module ApplicationHelper
  
  def display_base_errors(resource)
    return '' if (resource.errors.empty?) or (resource.errors[:base].empty?)
    messages = resource.errors[:base].map { |msg| content_tag(:p, msg) }.join
    
    html = <<-HTML
    <div class="alert alert-error alert-block">
      <button type="button" class="close" data-dismiss="alert">&#215;</button>
      #{messages}
    </div>
    HTML
    html.html_safe
  end
    
  # TODO return if user is logged in.
  def user_signed_in?
    false
  end
  
  # TODO return logoff action.
  def destroy_user_session_path
    ''
  end
  
  # Create user
  def new_user_session_path
    ''
  end
  
  # User register edit.
  def edit_user_registration_path
    ''
  end
  
  # New user.
  def new_user_registration_path
    ''
  end
  
end
