class AddDeptToAltcsrs < ActiveRecord::Migration[5.1]
  def change
    add_column :altcsrs, :dept, :string
  end
end
