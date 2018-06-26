class AddOnspecialsStartToOnspecials < ActiveRecord::Migration[5.1]
  def change
    add_column :onspecials, :onspecials_start, :date
  end
end
