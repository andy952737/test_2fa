# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    super
  end

  # POST /resource/sign_in
  def create
    # super
    email = params[:user][:email]
    admin = User.find_by(email: email)
    if admin.present?
        if admin.valid_password?(params[:user][:password])

          # test
          # admin = current_user # grab your currently logged in user
          # #admin.mfa_secret = 123456
          # #admin.save!
          # if admin.google_authentic?(123456)
          #   puts "登入成功"
          #   return
          #   # UserMfaSession.create(user)
          #   # redirect_to root_path
          # else 
          #   puts "Invalid code"
          #   return
          #   # flash.now[:danger] = "Invalid code"
          #   # render :new
          # end
          # return

          admin.set_google_secret           
          admin.google_secret_value         
          admin.google_qr_uri               
          admin.google_authentic?(123456)   
          admin.google_secret_value
          #admin.clear_google_secret!         
          admin.save

          sign_in admin 
          redirect_to user_mfa_sessions_new_path 
        else
          render json: "帳號密碼輸入錯誤"
          return 
        end
    else 
      redirect_to root_path
    end
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
