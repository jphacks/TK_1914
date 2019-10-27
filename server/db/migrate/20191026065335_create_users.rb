class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :nick_name
      t.string :img
      t.string :qr
    end
  end
end
