class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nick_name, presence: true
         validates :family_name, presence: true
         validates :first_name, presence: true
         validates :family_name_kana, presence: true, format: { with: /\A[ァ-ン一]+\z/, message: '全角文字を使用してください' } do
         validates :first_name_kana, presence: true, format: { with: /\A[ァ-ン一]+\z/, message: '全角文字を使用してください' } do
         validates :birth_day, presence: true
         end
        end
end

