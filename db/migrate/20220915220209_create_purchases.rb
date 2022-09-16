class CreatePurchases < ActiveRecord::Migration[7.0]
  def change
    create_table :purchases do |t|
      t.string :pokemon_id
      t.string :pokemon_name
      t.integer :base_experience
      t.references :investor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
