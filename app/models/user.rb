class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  has_many :access_grants,
           class_name: 'Doorkeeper::AccessGrant',
           foreign_key: :resource_owner_id,
           dependent: :delete_all
  has_many :access_token,
           class_name: 'Doorkeeper::AccessToken',
           foreign_key: :resource_owner_id,
           dependent: :delete_all
  has_many :oauth_applications, class_name: 'Doorkeeper::Application', as: :owner

  validates :email, format: {
    with: /\@fun\.ac\.jp\z/,
    message: I18n.t('errors.messages.not_fun'),
  }
end
