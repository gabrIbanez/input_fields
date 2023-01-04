class AddInputInformations < ActiveRecord::Migration[7.0]
  def change
    add_column :input_fields, :hint, :string, default: ""
    add_column :input_fields, :required, :boolean, default: false
    add_column :input_fields, :label, :string
    add_column :input_fields, :position, :integer
  end
end
