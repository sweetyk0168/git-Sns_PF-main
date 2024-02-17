class ChangeOptioncustomerIntroductionTocustomers < ActiveRecord::Migration[6.1]
  def change
    change_column_null :customers, :customer_introduction, false, ""
    change_column_default :customers, :customer_introduction, from: nil, to: ""
  end
end
