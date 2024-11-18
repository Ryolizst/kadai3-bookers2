class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|

   t.string :title, null: false           # `null: false` 制約を追加
      t.text :body, null: false              # `null: false` 制約を追加
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end