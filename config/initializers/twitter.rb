file_path     = "#{Rails.root}/config/twitter.yml"
config        = YAML.load( File.read(file_path) )
TWITTER_LISTS = config.fetch("lists", []).freeze
