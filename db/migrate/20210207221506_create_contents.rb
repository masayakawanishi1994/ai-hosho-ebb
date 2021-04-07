class CreateContents < ActiveRecord::Migration[6.0]
  def change
    create_table :contents do |t|
      t.string :detail, null: false
      t.references :bank, foreign_key: true, index: false
      t.references :category, foreign_key: true, index: false
      t.references :user, foreign_key: true, index: false
      
      t.timestamps
    end
    add_index :contents, [:bank_id, :category_id], unique: true
  end
end
