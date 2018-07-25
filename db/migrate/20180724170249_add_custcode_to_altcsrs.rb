class AddCustcodeToAltcsrs < ActiveRecord::Migration[5.1]
  def change
    add_column :altcsrs, :custcode, :string
  end
end
