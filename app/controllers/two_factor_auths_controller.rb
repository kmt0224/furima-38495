class TwoFactorAuthsController < ApplicationController
  before_action :move_to_new_user_session
  before_action :move_to_item_index, except:[:destroy, :create]

  def new
  end
  def create
    if current_user.validate_and_consume_otp!(params[:otp_attempt])
      current_user.otp_required_for_login = true
      current_user.save!

      redirect_to root_path

    else
      @error = 'Invalid pin code'

      render 'new'
    end
  end
  def show
    @qr_code = build_qr_code
  end
  def destroy
    current_user.update_attributes(
      otp_required_for_login:    false,
      encrypted_otp_secret:      nil,
      encrypted_otp_secret_iv:   nil,
      encrypted_otp_secret_salt: nil,
    )
    redirect_to root_path
  end

  private
  def build_qr_code
    label = "Furima-38495"
    issuer ="#{current_user[:email]}"
    uri = current_user.otp_provisioning_uri(label, issuer: issuer)
    qrcode = RQRCode::QRCode.new(uri)
    qrcode.as_svg(
      offset: 0,
      color: '000',
      shape_rendering: 'crispEdges',
      module_size: 4
    ).html_safe
  end

  def move_to_new_user_session
    redirect_to new_user_session_path unless user_signed_in?
  end

  def move_to_item_index
    redirect_to root_path if current_user.otp_required_for_login == true
  end

end
