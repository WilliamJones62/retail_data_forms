class AddCalllistsDayToCalllists < ActiveRecord::Migration[5.1]
  def change
    add_column :calllists, :calllists_day, :string
  end
end
