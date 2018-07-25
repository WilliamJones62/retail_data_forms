class RemoveCustomerFromAltcsrs < ActiveRecord::Migration[5.1]
  def change
    remove_column :altcsrs, :customer, :string
  end
end
