class AddCallbackDateToCalllists < ActiveRecord::Migration[5.1]
  def change
    add_column :calllists, :callback_date, :date
  end
end
