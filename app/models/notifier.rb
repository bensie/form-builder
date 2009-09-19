class Notifier < ActionMailer::Base
  
  def form_submission(submission, sent_at = Time.now)
    subject    "Form Submission: #{submission.form.name}"
    recipients submission.form.email
    from       "noreply@yourdomain.com"
    sent_on    sent_at
    body       :submission => submission
  end

end
