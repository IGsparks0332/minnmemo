class AddtypeToSentences < ActiveRecord::Migration[5.0]
  def change
      add_column :sentences, :type, :integer , default: 1 , null: false
  end
end
