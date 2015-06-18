class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.references :lesson, index: true, foreign_key: true
      t.references :course, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
