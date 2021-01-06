class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
  validates :password, presence: true, format: { with: PASSWORD_REGEX}
         
  
  validates :name,             presence: true
  validates :last_name,        presence: true
  validates :first_name,       presence: true
  validates :last_name_kana,   presence: true, format: {with: /\A[\p{katakana}\p{blank}ー－]+\z/}
  validates :first_name_kana,  presence: true, format: {with: /\A[\p{katakana}\p{blank}ー－]+\z/}
  validates :birthday,         presence: true
end
