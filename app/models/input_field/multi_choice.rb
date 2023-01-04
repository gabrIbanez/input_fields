module InputField 
	class MultiChoice < Base
    accepts_nested_attributes_for :options, reject_if: :all_blank, allow_destroy: true

		def input_name
			'multi_choice'
		end
	end
end
