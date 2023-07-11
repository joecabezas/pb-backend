class CreateFrequencies < ActiveRecord::Migration[7.0]
  def change
    create_table :frequencies do |t|
      t.string :name

      t.timestamps
    end
  end
end
