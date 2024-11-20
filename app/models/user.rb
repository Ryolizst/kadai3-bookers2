class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # ユーザー名を認証に使う
  validates :name, presence: true, uniqueness: true, length: { in: 2..20 }
  validates :introduction, length: { maximum: 50 }

  # 画像添付機能を追加
  has_one_attached :profile_image

  # Userモデルとの関連付け（N対1）
  has_many :books, dependent: :destroy

   # コメントの関連付けを追加
  has_many :comments, dependent: :destroy

# いいね機能の関連付けを追加
  has_many :favorites, dependent: :destroy

end