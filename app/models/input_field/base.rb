module InputField 
	class Base < ApplicationRecord
		self.table_name = 'input_fields'
		before_save :generate_slug

		has_many :options, class_name: "InputFieldOption",
												foreign_key: "input_field_id",
												dependent: :destroy,
												inverse_of: :input_field
		belongs_to :form
		
		def input_name
			'base'
		end

		private

		def generate_slug
			self.slug = 
				self.label
					.parameterize
					.underscore
		end
	end
end
