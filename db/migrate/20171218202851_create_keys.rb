class CreateKeys < ActiveRecord::Migration[5.1]
  def change
    create_table :keys do |t|
      t.integer :private
      t.text :public
      t.text :all

      t.timestamps
    end
  end
end
