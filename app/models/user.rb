class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
  validates :nick_name
  validates :family_name
  validates :first_name
  validates :birth_day

  with_options format: { with: /\A[ァ-ン一]+\z/ } do
  validates :family_name_kana
  validates :first_name_kana
  end

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: '６文字以上の半角英数字を入力してください' }
  end
end