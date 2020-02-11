# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  def select
    
  end

  def create
    build_resource(sign_up_params)
    session["devise.regist_data"] = {user: @user.attributes}
    session["devise.regist_data"][:encrypted_password] = nil
    session["devise.regist_data"][:user][:password] = params[:user][:password]
    redirect_to confirm_phone_path
  end
  
  def confirm_phone
  end

  def new_address
    @address = Address.new
    if @address.valid?
      session["devise.regist_data"][:address] = @address
      redirect_to new_regist_payment_path
    else
      redirect_to new_regist_address_path, alert: @address.errors.full_messages
    end
  end

  def create_address
    @address = Address.new(address_params)
    session["devise.regist_data"][:address] = @address
    redirect_to new_regist_payment_path
  end

  def new_payment
    render template: "cards/new"
  end
  
  def completed
    @user = build_resource(session["devise.regist_data"]["user"])
    @user.build_address(session["devise.regist_data"]["address"])
    @user.save
    binding.pry
  end

  private

  def address_params
    params.require(:address).permit(:postal_code, :prefecture, :city, :house_number, :building_name, :phone_number)
  end

 

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
