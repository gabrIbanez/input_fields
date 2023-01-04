module InputField 
	class SelectOption < Base
    accepts_nested_attributes_for :options, reject_if: :all_blank, allow_destroy: true

		def input_name
			'select_option'
		end
	end
end
