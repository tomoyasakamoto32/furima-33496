class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
  validates :password, presence: true, format: { with: PASSWORD_REGEX}
         
  with_options presence: true do
    validates :name             
    validates :last_name        
    validates :first_name       
    validates :last_name_kana,  format: {with: /\A[\p{katakana}\p{blank}ー－]+\z/}
    validates :first_name_kana, format: {with: /\A[\p{katakana}\p{blank}ー－]+\z/}
    validates :birthday
  end
end
