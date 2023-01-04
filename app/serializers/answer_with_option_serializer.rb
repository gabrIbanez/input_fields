class AnswerWithOptionSerializer
	def serialize(answer, input_field)
		{
			input_type: input_field.input_name,
			answer_value: answer[1],
			label: input_field.label,
			options: options_list(input_field.options)
		}
	end

	private

	def options_list(options)
		options.map do |option|
			{
				id: option.id,
				name: option.name
			}
		end
	end
end
