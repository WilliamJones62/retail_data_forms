class AddAltcsrsDayToAltcsrs < ActiveRecord::Migration[5.1]
  def change
    add_column :altcsrs, :altcsrs_day, :string
  end
end
