class CreatePillars < ActiveRecord::Migration[7.0]
  def change
    create_table :pillars do |t|
      t.string :name

      t.timestamps
    end
  end
end
