module SubmissionsHelper
  
  def generate_label_and_form_tag(ff)
    html = "<p>"
    case ff.object.form_field.tag
    when "text_field"
      html += "<strong>" + (ff.label :entry, "#{ff.object.form_field.label}:") + "</strong>" + "<br />"
      html += ff.text_field :entry
    when "text_area"
      html += "<strong>" + (ff.label :entry, "#{ff.object.form_field.label}:") + "</strong>" + "<br />"
      html += ff.text_area :entry, :cols => 50, :rows => 6
    when "select"
      html += "<strong>" + (ff.label :entry, "#{ff.object.form_field.label}:") + "</strong>" + "<br />"
      html += ff.select :entry, ff.object.form_field.values.split("\r\n"), :include_blank => "Select #{ff.object.form_field.label}..."
    when "check_box"
      html += ff.check_box :entry
      html += " "
      html += "<strong>" + (ff.label :entry, "#{ff.object.form_field.label}") + "</strong>"
    when "date_select"
      html += "<strong>" + (ff.label :entry_datetime, "#{ff.object.form_field.label}:") + "</strong>" + "<br />"
      html += ff.date_select :entry_datetime, :include_blank => true
    #when "radio_button"
    #  ff.object.form_field.values.split("\n") do
    #    html += ff.radio_button :entry, ff.object.form_field.values.split("\n").first
    #    html += ff.label :entry, "#{ff.object.form_field.label}:"
    #  end.join("<br />")
    end
    html += "</p>"
  end
  
end
