class RedocumentController < ApplicationController
  def download
    @upload = Upload.find(params[:id])
    send_file @upload.file.path, disposition: 'attachment', x_sendfile: true
  end
end
