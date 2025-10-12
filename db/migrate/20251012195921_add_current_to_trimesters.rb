class AddCurrentToTrimesters < ActiveRecord::Migration[8.0]
  def change
    add_column :trimesters, :current, :boolean
  end
end
