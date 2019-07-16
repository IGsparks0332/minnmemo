class AddpageToSentences < ActiveRecord::Migration[5.0]
  def change
    add_column :sentences, :page, :integer
    add_column :sentences, :plus, :text
  end
end
