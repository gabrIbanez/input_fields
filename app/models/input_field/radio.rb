module InputField 
	class Radio < Base
    accepts_nested_attributes_for :options, reject_if: :all_blank, allow_destroy: true

		def input_name
			'radio'
		end
	end
end
