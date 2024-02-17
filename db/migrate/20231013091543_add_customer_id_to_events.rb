class AddCustomerIdToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :customer_id, :integer
  end
end
