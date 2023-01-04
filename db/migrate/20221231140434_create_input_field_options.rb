class CreateInputFieldOptions < ActiveRecord::Migration[7.0]
  def change
    create_table :input_field_options do |t|
      t.string :name
      t.references :input_field, null: false, foreign_key: true
      t.integer :position
      t.json :data

      t.timestamps
    end
  end
end
