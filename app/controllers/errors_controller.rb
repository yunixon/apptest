class ErrorsController < ApplicationController
  def not_found
    respond_to do |format|
      format.html { render status: 404 }
      format.all  { render text: 'Error: 404', status: 404 }
    end
  end
end
