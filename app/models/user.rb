class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nick_name,          presence: true
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
  validates :encrypted_password, format: { with: VALID_PASSWORD_REGEX, message: "Include both letters and numbers"}
  validates :first_name,         presence: true
  validates :family_name,        presence: true
  validates :kana_first_name,    presence: true
  validates :kana_family_name,   presence: true
  validates :birthday,           presence: true

end
