class CreateAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :answers do |t|
      t.references :form, null: false, foreign_key: true
      t.json :data
      t.boolean :deleted, default: false, null: false
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
