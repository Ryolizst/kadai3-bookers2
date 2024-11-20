class Book < ApplicationRecord
   # Userモデルとの関連付け（N対1）
  belongs_to :user

   # バリデーションを追加(空白投稿を防ぐand字数制限)
  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 200 }

 # コメントの関連付けを追加
  has_many :comments, dependent: :destroy

   # いいね機能の関連付けを追加
  has_many :favorites, dependent: :destroy

  # ユーザーがこの本をすでに「いいね」しているかを判定するメソッド
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
end
