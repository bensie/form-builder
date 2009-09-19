class Submission < ActiveRecord::Base
  
  has_many :form_values, :dependent => :destroy
  
  belongs_to :form
  
  accepts_nested_attributes_for :form_values
  
  validate :required_form_values_are_present?
  
  private
  
  def required_form_values_are_present?
    form_values.each do |val|
      if val.form_field.required?
        if (val.form_field.tag == "date_select" || val.form_field.tag == "datetime_select") && val.entry_datetime.blank?
          errors.add_to_base("#{val.form_field.label} can't be blank")
        end
        if (val.form_field.tag != "date_select" && val.form_field.tag != "datetime_select") && val.entry.blank?
          errors.add_to_base("#{val.form_field.label} can't be blank")
        end
      end
    end
  end
  
end
