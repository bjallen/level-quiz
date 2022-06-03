class CreateBehaviors < ActiveRecord::Migration[7.0]
  def change
    create_table :behaviors do |t|
      t.string :description
      t.references :competency, null: false, foreign_key: true
      t.references :level, null: false, foreign_key: true

      t.timestamps
    end
  end
end
