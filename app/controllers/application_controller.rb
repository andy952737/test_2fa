class ApplicationController < ActionController::Base

	# before_action :check_mfa

	# private

  # def check_mfa
  #   if !(user_mfa_session = UserMfaSession.find) && (user_mfa_session ? user_mfa_session.record == current_user : !user_mfa_session)
  #     #redirect_to user_mfa_sessions_new_path
  #     redirect_to user_mfa_sessions_new_path
  #   end
  #   if "/logout" == request.path
  #     current_user.mfa_secret = nil
  #     current_user.save!
  #     UserMfaSession.destroy
  #   end
  # end
  
end
