class User < ApplicationRecord
    has_many :questions
    has_many :answers
    has_many :qcomments
    has_many :acomments
    has_many :user_skills
    has_many :skills, through: :user_skills
    acts_as_voter

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook, :google_oauth2]

    def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
          user.email = auth.info.email
          user.name = auth.info.name
          user.password = Devise.friendly_token[0,20]
      end
    end

    def displayName
      if display_name
        display_name
      else
        names = name.split
        firstname = names.first
        lastname = names.last[0,1]
        firstname + " " + lastname
      end
    end

end
