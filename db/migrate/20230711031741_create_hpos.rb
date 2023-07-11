class CreateHpos < ActiveRecord::Migration[7.0]
  def change
    create_table :hpos do |t|
      t.string :hpo_id
      t.string :term
      t.references :frequency, null: false, foreign_key: true

      t.timestamps
    end
  end
end
