class FormField < ActiveRecord::Base
  
  acts_as_list :scope => :form
  
  belongs_to :form
  has_many :form_values
    
end
