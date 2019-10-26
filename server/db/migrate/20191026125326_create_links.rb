class CreateLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :links do |t|
      t.references :user
      t.references :media_platform
      t.string :link, null: false
    end
  end
end
