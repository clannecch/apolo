class AttachmentsController < ApplicationController

  # GET /attachments/1
  # GET /attachments/1.xml
  def show
    @attachment = Attachment.unscoped.find(params[:id])

    send_data @attachment.adjunto_file, :name => @attachment.adjunto_file_name,:type => @attachment.adjunto_content_type, :disposition => 'attachment'
  end


end

