class PictureUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
  
   version :thumb do
    process :resize_to_fit => [260, 260]
  end

  version :extra_large do
    process :resize_to_fit => [1000, 1000]
  end
end
