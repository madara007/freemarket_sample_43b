require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  if Rails.env.development? || Rails.env.test?
    config.storage = :file
  elsif Rails.env.production?
    # config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/freemarket-sample-43b'
    config.asset_host = ENV["S3_BUCKET_ADDRESS"]
    config.storage = :fog
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: Rails.application.secrets.aws_access_key_id,
      aws_secret_access_key: Rails.application.secrets.aws_secret_access_key,
      region: 'ap-northeast-1'
    }
  end
  # config.fog_directory  = 'freemarket-sample-43b'
  config.fog_directory  = ENV["S3_BUCKET_NAME"]
end
