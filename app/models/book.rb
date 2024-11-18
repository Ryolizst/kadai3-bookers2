class Book < ApplicationRecord
   # Userモデルとの関連付け（N対1）
  belongs_to :user

   # バリデーションを追加(空白投稿を防ぐand字数制限)
  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 200 }

end
