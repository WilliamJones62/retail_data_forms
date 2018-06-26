class AddAltcsrsStartToAltcsrs < ActiveRecord::Migration[5.1]
  def change
    add_column :altcsrs, :altcrs_start, :date
  end
end
