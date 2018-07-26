class AddCallbackDayToCalllists < ActiveRecord::Migration[5.1]
  def change
    add_column :calllists, :callback_day, :string
  end
end
