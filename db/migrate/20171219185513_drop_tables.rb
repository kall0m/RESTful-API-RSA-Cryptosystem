class DropTables < ActiveRecord::Migration[5.1]
  def change
		drop_table :encrypt_messages
		drop_table :decrypt_messages
  end
end
