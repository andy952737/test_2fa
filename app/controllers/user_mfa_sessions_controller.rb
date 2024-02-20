class UserMfaSessionsController < ApplicationController
  before_action :check_mfa
  skip_before_action :check_mfa, only: [:new, :create]
  # before_action :check_mfa, only: [:new, :create]

  def new
    @user = User.find(current_user.id) 
    @qr_code_uri = @user.google_qr_uri(@user.email) 
    @google_secret = @user.google_secret
  end

  def create
    user = current_user # grab your currently logged in user
    user.mfa_secret = params[:mfa_code]
    user.save!
    if user.google_authentic?(params[:mfa_code])
      UserMfaSession.create(user)
      redirect_to root_path
    else
      flash.now[:danger] = "Invalid code"
      render :new
    end
  end

  private

  def check_mfa
    if !(user_mfa_session = UserMfaSession.find) && (user_mfa_session ? user_mfa_session.record == current_user : !user_mfa_session)
      #redirect_to user_mfa_sessions_new_path
      redirect_to user_mfa_sessions_new_path
    end
    if "/logout" == request.path
      current_user.mfa_secret = nil
      current_user.save!
      UserMfaSession.destroy
    end
  end


end
