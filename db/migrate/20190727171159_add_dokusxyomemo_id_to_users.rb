class AddDokusxyomemoIdToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :bookmeter_id, :string
  end
end
