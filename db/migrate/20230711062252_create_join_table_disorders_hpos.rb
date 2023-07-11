class CreateJoinTableDisordersHpos < ActiveRecord::Migration[7.0]
  def change
    create_join_table :disorders, :hpos do |t|
      # t.index [:disorder_id, :hpo_id]
      # t.index [:hpo_id, :disorder_id]
    end
  end
end
