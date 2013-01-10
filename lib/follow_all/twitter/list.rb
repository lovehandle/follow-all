module FollowAll
  module Twitter
    class List

      def initialize(client, user, name)
        @client, @user, @name = client, user, name
      end

      def users
        arr = []
        cursor = -1
        until cursor == 0
          list_members = client.list_members(user, name, cursor: cursor, skip_status: true, include_entities: false)
          arr += list_members.users
          cursor = list_members.next_cursor
        end
        arr
      end

      protected

      attr_reader :client, :user, :name

    end
  end
end
