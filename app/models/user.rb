class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nick_name, presence: true
         validates :password, presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: '６文字以上の半角英数字を入力してください' }
         validates :family_name, presence: true
         validates :first_name, presence: true
         validates :family_name_kana, presence: true, format: { with: /\A[ァ-ン一]+\z/ }
         validates :first_name_kana, presence: true, format: { with: /\A[ァ-ン一]+\z/ }
         validates :birth_day, presence: true
         
        
end

