class AvatarUploader < CarrierWave::Uploader::Base
  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def filename
    "#{uuid}.#{file.extension}" if original_filename.present?
  end

  def extension_whitelist
    %w(jpg jpeg png)
  end

  protected

  def uuid
    @uuid ||= SecureRandom.uuid
  end
end
