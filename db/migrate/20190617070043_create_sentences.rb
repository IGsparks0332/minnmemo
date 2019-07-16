class CreateSentences < ActiveRecord::Migration[5.0]
  def change
    create_table :sentences do |t|
      t.text :body
      t.text :title
      t.string :author
      t.string :publisher
      t.integer :user_id
      t.timestamps
    end
  end
end
