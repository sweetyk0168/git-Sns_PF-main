class ChangeOptionPriceToGoods < ActiveRecord::Migration[6.1]
  def change
    change_column_null :goods, :price, false, 0
     change_column_default :goods, :price, from: nil, to: 0
  end
end
