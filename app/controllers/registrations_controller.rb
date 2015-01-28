class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    build_resource(sign_up_params)

    if resource.save
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_navigational_format?
        sign_up(resource_name, resource)
        return render json: {success: true, notice: "Welcome aboard!"}
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
        expire_session_data_after_sign_in!
        return render json: {success: true, notice: "Welcome aboard!"}
      end
    else
      clean_up_passwords resource
      return render json: {success: false, errors: @user.errors.full_messages}
    end
  end

  def sign_up(resource_name, resource)
    sign_in(resource_name, resource)
  end

  def sign_up_params
    devise_parameter_sanitizer.sanitize(:sign_up)
  end

  def update
    self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
    prev_unconfirmed_email = resource.unconfirmed_email if resource.respond_to?(:unconfirmed_email)

    if update_resource(resource, account_update_params)
      yield resource if block_given?
      if is_flashing_format?
        flash_key = update_needs_confirmation?(resource, prev_unconfirmed_email) ? :update_needs_confirmation : :updated
        set_flash_message :notice, flash_key
      end
      sign_in resource_name, resource, bypass: true
      return render json: {success: true, notice: "Congrats, you did it!"}
    else
      clean_up_passwords resource
      return render json: {success: false, errors: @user.errors.full_messages}
    end
  end
end