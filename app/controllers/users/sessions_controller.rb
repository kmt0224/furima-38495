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
  prepend_before_action :authenticate_with_two_factor, only: [:create]

  private
  def authenticate_with_two_factor
    user_params = params.require(:user).permit(:email, :password, :remember_me, :otp_attempt)

    if user_params[:otp_attempt].present? && session[:otp_user_id]
      user = User.find(session[:otp_user_id])
    elsif user_params[:email]
      user = User.find_by(email: user_params[:email])
    end
    self.resource = user

    if user_params[:otp_attempt].present? && session[:otp_user_id]
      if user.validate_and_consume_otp!(user_params[:otp_attempt]) || user.invalidate_otp_backup_code!(user_params[:otp_attempt])
        session.delete(:otp_user_id)
        user.save!
        sign_in(user)
        redirect_to root_path
      else
        @error = 'Invalid two-factor code.'
        render :two_factor
      end    
    elsif user_params[:email]
      if user.valid_password?(user_params[:password])
        session[:otp_user_id] = user.id
        render 'devise/sessions/two_factor'
      end
    end
  end
end