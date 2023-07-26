# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  def create
    @user = User.find_by(email: params[:user][:email])
    self.resource = @user
      if @user.valid_password?(params[:user][:password])
        session[:otp_user_id] = @user.id
        redirect_to users_two_factor_path and return
      end
  end

  def new_two_factor
  end

  def create_two_factor
    user = User.find(session[:otp_user_id])
    if user.validate_and_consume_otp!(params[:otp_attempt]) || user.invalidate_otp_backup_code!(params[:otp_attempt])
      session.delete(:otp_user_id)
      user.save!
      sign_in(user)
      redirect_to root_path
    else
      @error = 'Invalid two-factor code.'
      render :new_two_factor
    end
  end
end