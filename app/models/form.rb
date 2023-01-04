class Form < ApplicationRecord
  belongs_to :user
  has_many :input_fields, class_name: 'InputField::Base'
  accepts_nested_attributes_for :input_fields, allow_destroy: true
end
