class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #acts_as_google_authenticated :column_name => :user_name
  acts_as_google_authenticated lookup_token: :mfa_secret, encrypt_secrets: true
  # @user = User.new
  # @user.set_google_secret           # => true
  # @user.google_secret_value         # => 16-character plain-text secret, whatever the name of the secret column
  # @user.google_qr_uri               # => http://path.to.chart/qr?with=params
  # @user.google_authentic?(123456)   # => true
  # @user.clear_google_secret!        # => true
  # @user.google_secret_value         # => nil
  # @user.save
         
end
