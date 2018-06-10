CarrierWave.configure do |config|
  if Rails.env.production?
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['AWS_S3_ADMIN_ID'],
      aws_secret_access_key: ENV['AWS_S3_ADMIN_SECRET'],
      region: 'ap-northeast-1'
    }
    config.fog_directory = ENV['S3_DIRECTORY']
    config.asset_host = ENV['S3_ENDPOINT']
    config.storage = :fog
    config.fog_attributes = { 'Cache-Control' => 'public, max-age=86400' }
  else
    config.asset_host = "http://localhost:3000/"
    config.storage = :file
  end
end
