class AnswerSerializer
	def serialize(answer, input_field)
		{
			input_type: input_field.input_name,
			answer_value: answer[1],
			label: input_field.label,
		}
	end
end
