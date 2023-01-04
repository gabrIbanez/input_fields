class InputFieldOption < ApplicationRecord
  belongs_to :input_field, class_name: 'InputField::Base', touch: true
end
