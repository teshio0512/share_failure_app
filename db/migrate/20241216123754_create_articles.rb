class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.text :theme, null: false
      t.text :issue, null: false
      t.text :measure, null: false
      t.text :result, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
