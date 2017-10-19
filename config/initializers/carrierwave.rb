require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  config.storage = :fog
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
    aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
    region: 'ap-northeast-1'
  }
  config.fog_directory = ENV['S3_BUCKET_NAME']

    case Rails.env
    when 'development'
        config.fog_directory  = 'protospaceteama'
        #config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/protospaceteama'
        config.asset_host = ENV['AWS_S3_URL']
    when 'production'
        config.fog_directory  = 'protospaceteama'
        #config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/protospaceteama'
        config.asset_host = ENV['AWS_S3_URL']
    end
end

