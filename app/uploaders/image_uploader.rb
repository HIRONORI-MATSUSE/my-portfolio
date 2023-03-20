class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  # process scale: [50, 50]

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url
    'default.png'
  end
  
  #アップロードを許可するファイル種類を指定する。
  def extension_allowlist
    %w(jpg jpeg gif png)
  end
end
