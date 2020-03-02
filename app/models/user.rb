class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,:validatable

  attachment :profile_image, destroy: false

  #バリデーションは該当するモデルに設定する。エラーにする条件を設定できる。
  validates :name,  presence: true, length: {maximum: 20, minimum: 2}
  validates :introduction, length: { maximum: 50 }
  # validateの条件が2つ不足！！＃

  has_many :books, dependent: :destroy
  # has_many（dependent: :destroy追記）&belongs_toの記述間違い！！#
end
