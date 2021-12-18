class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
         validates_format_of :password, with: PASSWORD_REGEX, message: 'Password is invalid. Include both letters and numbers'
       
         with_options presence: true, format: { with: /\A[ぁ-んァ-ヶー-龥々]+\z/, message: 'is invalid. Input full-width characters' } do
           validates :family_name
           validates :first_name
         end
       
         with_options presence: true, format: { with: /\A[ァ-ヶ]+\z/, message: 'is invalid. Input full-width katakana characters' } do
           validates :family_name_kana
           validates :first_name_kana
         end

     with_options presence: true do
      validates :nickname
      validates :family_name
      validates :first_name
      validates :family_name_kana
      validates :first_name_kana
      validates :birth_day
    end     
end
