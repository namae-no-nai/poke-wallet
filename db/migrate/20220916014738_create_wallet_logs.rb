class CreateWalletLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :wallet_logs do |t|
      t.integer :pokemon_id
      t.string :pokemon_name
      t.decimal :usd_value, :precision => 9, :scale => 6
      t.references :investor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
