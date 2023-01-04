class CreateForms < ActiveRecord::Migration[7.0]
  def change
    create_table :forms do |t|
      t.references :user, null: false, foreign_key: true
      t.text :title
      t.boolean :active

      t.timestamps
    end
  end
end
