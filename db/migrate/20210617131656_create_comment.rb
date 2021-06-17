class CreateComment < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :body
      t.references :article, null: false, foreign_key: true
    end
  end
end
