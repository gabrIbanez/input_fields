class AddSlugToInputField < ActiveRecord::Migration[7.0]
  def change
    add_column :input_fields, :slug, :string
  end
end
