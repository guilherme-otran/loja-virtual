module ApplicationHelper
  
  def root_path
    '/index'
  end
  
  def user_signed_in?
    false
  end
  
  #logoff
  def destroy_user_session_path
    ''
  end
  
  #create user
  def new_user_session_path
  end
  
  #user register edit.
  # Checar se sera necessario
  def edit_user_registration_path
    ''
  end
  
  #Novo usuario
  def new_user_registration_path
    ''
  end
  
  
  
end
