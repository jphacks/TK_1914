class CreateMediaPlatforms < ActiveRecord::Migration[5.2]
  def change
    create_table :media_platforms do |t|
      t.string :name, null: false
    end
  end
end
