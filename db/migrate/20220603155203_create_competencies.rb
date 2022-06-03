class CreateCompetencies < ActiveRecord::Migration[7.0]
  def change
    create_table :competencies do |t|
      t.string :name
      t.references :pillar, null: false, foreign_key: true

      t.timestamps
    end
  end
end
