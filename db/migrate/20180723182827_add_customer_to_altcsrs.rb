class AddCustomerToAltcsrs < ActiveRecord::Migration[5.1]
  def change
    add_column :altcsrs, :customer, :string
  end
end
