class CreateBankCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :bank_categories do |t|

      t.references :bank, foreign_key: true
      t.references :category, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
