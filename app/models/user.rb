class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

  has_many :sites

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    puts user
    unless user.present?
      user = User.where(:email => auth.info.email, :provider => nil, :uid => nil).first
      puts user
      if user.present?
        user.update_attributes(provider: auth.provider, uid: auth.uid)
      else
        user = User.create(
                           #name:auth.extra.raw_info.name,
                           provider: auth.provider,
                           uid: auth.uid,
                           email: auth.info.email,
                           password: Devise.friendly_token[0,20]
        )
        end
    end
    user
  end

end
