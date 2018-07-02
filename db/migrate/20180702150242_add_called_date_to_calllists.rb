class AddCalledDateToCalllists < ActiveRecord::Migration[5.1]
  def change
    add_column :calllists, :called_date, :date
  end
end
