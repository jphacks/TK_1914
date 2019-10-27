class ChangeLinkColumnToUrl < ActiveRecord::Migration[5.2]
  def change
    rename_column(:links, :link, :url)
  end
end
