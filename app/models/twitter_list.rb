class TwitterList < Struct.new(:client, :user, :name)

  def self.users(*args)
    new(*args).users
  end

  def users
    [].tap do |users_array|
      cursor = -1
      until cursor == 0
        options = {
          cursor:           cursor,
          skip_status:      true,
          include_entities: false
        }
        list_members = client.list_members(user, name, options)
        users_array << list_members.users
        cursor       = list_members.next_cursor
      end
    end.flatten
  end

end
