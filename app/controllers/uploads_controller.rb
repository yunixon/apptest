class UploadsController < ApplicationController
  before_action :set_upload, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @upload = current_user.uploads.new
  end

  def edit
  end

  def create
    @upload = current_user.uploads.new(upload_params)
    @upload.file = params[:file]
    respond_to do |format|
      if @upload.save
        format.html { redirect_to current_user, notice: 'Upload was successfully created.' }
        format.json { render :show, status: :created, location: [current_user, @upload] }
      else
        format.html { render :new }
        format.json { render json: @upload.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @upload.file = params[:file]
    respond_to do |format|
      if @upload.update(upload_params)
        format.html { redirect_to current_user, notice: 'Upload was successfully updated.' }
        format.json { render :show, status: :ok, location: current_user }
      else
        format.html { render :edit }
        format.json { render json: @upload.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @upload.destroy
    respond_to do |format|
      format.html { redirect_to current_user, notice: 'Upload was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_upload
      @upload = current_user.uploads.find(params[:id])
    end

    def upload_params
      params.require(:upload).permit(:title, :file, :user_id)
    end
end
