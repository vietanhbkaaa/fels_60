class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.references :lesson, index: true, foreign_key: true
      t.references :answer, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :options, [:lesson_id, :answer_id], unique: true
  end
end
