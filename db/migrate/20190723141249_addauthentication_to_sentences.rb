class AddauthenticationToSentences < ActiveRecord::Migration[5.0]
  def change
    add_column :sentences, :suspicious, :boolean , default: false , null: false
  end
end
