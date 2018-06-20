class RemoveReasonFromCalllists < ActiveRecord::Migration[5.1]
  def change
    remove_column :calllists, :reason, :text
  end
end
