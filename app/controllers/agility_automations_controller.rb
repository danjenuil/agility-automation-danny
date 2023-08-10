class AgilityAutomationsController < ApplicationController
  def create
    record = AgilityAutomation.new(
      "First Name" => params[:first_name],
      "Last Name" => params[:last_name],
      "Email Address" => params[:email_address],
      "Date of Birth" => params[:date_of_birth],
      "Attachment" => [{ url: helpers.upload_file(params[:file])}]
    )

    if record.save
      redirect_to submitted_path
    end
  end

  def submission_confirmation; end
end
