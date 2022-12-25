class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/
  VALID_KANA_NAME_REGEX = /\A[ァ-ヶー－]+\z/

  validates :nick_name,          presence: true
  validates :password,           format: { with: VALID_PASSWORD_REGEX, message: "Include both letters and numbers"}
  validates :first_name,         presence: true, format: { with: VALID_NAME_REGEX, message: "全角（漢字・ひらがな・カタカナ）で入力してください"}
  validates :family_name,        presence: true, format: { with: VALID_NAME_REGEX, message: "全角（漢字・ひらがな・カタカナ）で入力してください"}
  validates :kana_first_name,    presence: true, format: { with: VALID_KANA_NAME_REGEX, message: "全角（カタカナ）で入力してください"}
  validates :kana_family_name,   presence: true, format: { with: VALID_KANA_NAME_REGEX, message: "全角（カタカナ）で入力してください"}
  validates :birthday,           presence: true

end
