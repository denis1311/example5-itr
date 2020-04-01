 class ImageUploader < CrarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  storage :file

  def store_dir
    "uploades/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end




  version :large do
    process resize_to_fit: [900,900]
  end

  version :thumb do
    process resize_to_fit: [200,200]
  end


  def extention_whitelist
    %w(jpg jpeg gif png)
  end
