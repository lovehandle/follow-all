class TwitterUser < Struct.new(:client, :user)

  def self.lists(*args)
    new(*args).lists
  end

  def self.follow_users(*args)
    users = args.pop
    new(*args).follow_users(users)
  end

  def lists
    begin
      client.lists(user)
    rescue Twitter::Error::NotFound
      []
    end
  end

  def follow_users(users)
    begin
      client.follow(users)
    rescue Twitter::Error::ServerError
      retry
    end
  end

end
