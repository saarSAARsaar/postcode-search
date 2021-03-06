class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :recoverable
  devise :database_authenticatable, :registerable,
       :rememberable, :validatable,
       :omniauthable, omniauth_providers: %i[github]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.email = auth.info.email
      user.uid = auth.uid
      user.username = auth.info.nickname
      user.token = auth.credentials.token
      user.password = Devise.friendly_token[0, 20]
    end
  end
end
  