class CreateAnswer
	SERIALIZERS = {
		text: AnswerSerializer,
		integer: AnswerSerializer,
		select_option: AnswerWithOptionSerializer,
		radio: AnswerWithOptionSerializer,
		multi_choice: AnswerWithOptionSerializer
	}

	def call(answers: [], form_id: nil)
		return if answers.empty?
		data = answer_lines(answers)
		Answer.new(form_id: form_id, data: data)
	end

	private

	def answer_lines(answers)
		answers.map do |answer|
			input_field = InputField::Base.find_by_slug(answer.first)
			answer_line(answer, input_field)
		end
	end

	def answer_line(answer, input_field)
		key = input_field.input_name.to_sym
		SERIALIZERS[key].new.serialize(answer, input_field)
	end
end