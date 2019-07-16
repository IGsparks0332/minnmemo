class AddColumnToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :name, :string, null: false, default: '', limit: 100
    add_column :users, :self_introduction, :string, limit: 500
    add_column :users, :job, :string
    add_column :users, :sex, :string
    add_column :users, :age, :integer
  end
end
