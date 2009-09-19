class SubmissionsController < ApplicationController
  
  before_filter :find_form
  before_filter :find_submission, :only => %w(show edit update destroy)
  
  def index
    @submissions = Submission.all
  end
  
  def show
  end
  
  def new
    @submission = @form.submissions.new
    @form.form_fields.all.each do |field|
      new_field = @submission.form_values.build
      new_field.form_field = field
    end
  end
  
  def create
    @submission = @form.submissions.build(params[:submission])
    if @submission.save
      if @submission.form.email.present?
        Notifier.deliver_form_submission(@submission)
      end
      flash[:notice] = "Successfully created submission."
      redirect_to [@form, @submission]
    else
      render :action => 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @submission.update_attributes(params[:submission])
      flash[:notice] = "Successfully updated submission."
      redirect_to [@form, @submission]
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @submission.destroy
    flash[:notice] = "Successfully destroyed submission."
    redirect_to form_submissions_path(@form)
  end
  
  protected
  
  def find_form
    @form = Form.find(params[:form_id])
  end
  
  def find_submission
    @submission = @form.submissions.find(params[:id])
  end
end
