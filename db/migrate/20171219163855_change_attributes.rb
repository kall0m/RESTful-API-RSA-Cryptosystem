class ChangeAttributes < ActiveRecord::Migration[5.1]
  def change
		change_column :keys, :private, :integer
		change_column :keys, :public, :integer
		change_column :keys, :all, :integer

		rename_column :keys, :private, :n
		rename_column :keys, :public, :e
		rename_column :keys, :all, :d
  end
end
