module ApplicationHelper
  
  def display_base_errors resource
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
  
  def root_path
    '/index'
  end
  
  # TODO Retornar se o usuario esta logado
  def user_signed_in?
    false
  end
  
  # TODO retornar action de Logoff
  def destroy_user_session_path
    ''
  end
  
  # TODO retornar action de Login
  def new_user_session_path
    ''
  end
  
  # TODO Editar cadastro. VERIFICAR SE REALMENTE DEVE SER FEITO
  def edit_user_registration_path
    ''
  end
  
  # TODO Novo cadastro
  def new_user_registration_path
    ''
  end
end
