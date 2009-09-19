class FormValue < ActiveRecord::Base
  
  belongs_to :form_field
  belongs_to :submission
  
end
