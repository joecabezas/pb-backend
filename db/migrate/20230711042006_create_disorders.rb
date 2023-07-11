class CreateDisorders < ActiveRecord::Migration[7.0]
  def change
    create_table :disorders do |t|
      t.integer :orpha_code
      t.string :expert_link
      t.string :name
      t.references :type, null: false, foreign_key: true
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
