class AvatarUploader < CarrierWave::Uploader::Base
  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def filename
    if original_filename.present? && @filename.eql?(original_filename)
      @filename = "#{SecureRandom.uuid}.#{file.extension.downcase}"
    end

    @filename
  end

  def extension_whitelist
    %w(jpg jpeg png)
  end
end
