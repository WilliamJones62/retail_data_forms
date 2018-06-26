class AddOnspecialsEndToOnspecials < ActiveRecord::Migration[5.1]
  def change
    add_column :onspecials, :onspecials_end, :date
  end
end
