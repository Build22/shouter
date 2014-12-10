class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :shouts


  has_many :followed_user_relationships,
    foreign_key: :follower_id,
    class_name: 'FollowingRelationship'

  has_many :followed_users, through: :followed_user_relationships

  has_many :follower_relationships,
    foreign_key: :followed_user_id,
    class_name: 'FollowingRelationship'

  has_many :followers, through: :follower_relationships

  attr_accessor :login

    devise :database_authenticatable, :registerable,
      :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:login]


    def login=(login)
      @login = login
    end

    def login
      @login || self.username || self.email
    end

    def self.find_first_by_auth_conditions(warden_conditions)
      conditions = warden_conditions.dup
      if login = conditions.delete(:login)
        where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
      else
        where(conditions).first
      end
    end

end
