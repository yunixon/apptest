class FileUploader < CarrierWave::Uploader::Base
  storage :file

  def store_dir
    "uploads/#{model.user_id}/#{model.id}"
  end
end
