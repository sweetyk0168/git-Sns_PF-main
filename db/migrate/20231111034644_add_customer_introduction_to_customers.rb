class AddCustomerIntroductionToCustomers < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :customer_introduction, :string
  end
end
