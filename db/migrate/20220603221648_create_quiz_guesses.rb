class CreateQuizGuesses < ActiveRecord::Migration[7.0]
  def change
    create_table :quiz_guesses do |t|
      t.references :behavior, null: false, foreign_key: true
      t.references :level, null: false, foreign_key: true
      t.references :competency, null: false, foreign_key: true

      t.timestamps
    end
  end
end
