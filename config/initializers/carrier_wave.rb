CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider => 'AWS',
    :aws_access_key_id => 'AKIAITQUPKSZG2XFT2MA',
    :aws_secret_access_key => '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',
    :region => 'ap-southeast-2'
  } 

  config.fog_directory = 'wastenot'
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}
end
