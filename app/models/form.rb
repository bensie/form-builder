class Form < ActiveRecord::Base
  
  has_many :submissions, :dependent => :destroy
  has_many :form_fields, :dependent => :destroy, :order => :position
  
  accepts_nested_attributes_for :form_fields, :allow_destroy => true
  
  named_scope :published, :conditions => { :published => true }

end
