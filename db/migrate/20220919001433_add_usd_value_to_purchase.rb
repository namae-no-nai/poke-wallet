class AddUsdValueToPurchase < ActiveRecord::Migration[7.0]
  def change
    add_column :purchases ,:usd_value, :decimal, :precision => 9, :scale => 6
  end
end
