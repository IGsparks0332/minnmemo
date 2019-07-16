class CreateReactions < ActiveRecord::Migration[5.0]
  def change
    create_table :reactions do |t|
      t.integer :sentence_id
      t.integer :user_id
      t.integer :like_id
      t.timestamps
    end
  end
end
