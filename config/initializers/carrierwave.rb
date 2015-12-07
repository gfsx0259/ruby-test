CarrierWave.configure do |config|
  config.storage    =  :aws                  # required
  config.aws_bucket =  'konstantinpopov'      # required
  config.aws_acl    =  :public_read

  config.aws_credentials = {
      access_key_id:      'AKIAJE6ELHGYIM4WUEBA',       # required
      secret_access_key:  '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',     # required
      region: 'us-east-1'
  }
  config.aws_attributes = {
      expires: 1.week.from_now.httpdate,
      cache_control: 'max-age=604800'
  }

  #config.cache_dir = '/home/vagrant/uploads_tmp/tmp/uploads'
  #config.root = '/home/vagrant/uploads_tmp/tmp'
end

