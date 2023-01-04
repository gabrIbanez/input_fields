class CreateInputFields < ActiveRecord::Migration[7.0]
  def change
    create_table :input_fields do |t|
      t.string :type
      t.references :form, null: false, foreign_key: true
      t.json :data

      t.timestamps
    end
  end
end
