class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
         
  with_options presence: true do
    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
    NAME_ZENKAKU = /\A[ぁ-んァ-ヶ一-龥々]+\z/
    NAME_KATAKANA = /\A[\p{katakana}\p{blank}ー－]+\z/
    validates :name             
    validates :password, format: { with: PASSWORD_REGEX}
    validates :last_name, format: {with: NAME_ZENKAKU}
    validates :first_name, format: {with: NAME_ZENKAKU}
    validates :last_name_kana,  format: {with: NAME_KATAKANA}
    validates :first_name_kana, format: {with: NAME_KATAKANA}
    validates :birthday
  end
end
