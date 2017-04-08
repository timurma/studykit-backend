class AvatarUploader < CarrierWave::Uploader::Base
  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def filename
    "#{uuid}.#{file.extension}" if original_filename.present?
  end

  def cache_dir
    "#{Rails.root}/tmp/uploads/cache/#{model.id}"
  end

  def extension_whitelist
    %w(jpg jpeg png)
  end

  protected

  def uuid
    uuid_value = :"@#{mounted_as}_uuid"
    model.instance_variable_get(uuid_value) || model.instance_variable_set(uuid_value, SecureRandom.uuid)
  end
end
