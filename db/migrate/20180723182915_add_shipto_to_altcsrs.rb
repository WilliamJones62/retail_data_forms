class AddShiptoToAltcsrs < ActiveRecord::Migration[5.1]
  def change
    add_column :altcsrs, :shipto, :string
  end
end
