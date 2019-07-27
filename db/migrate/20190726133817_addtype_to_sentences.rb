class AddtypeToSentences < ActiveRecord::Migration[5.0]
  def change
      add_column :sentences, :WebOrBook, :integer , default: 1 , null: false
  end
end
