module FollowAll
  module Twitter
    class User

      def initialize(client)
        @client = client
      end

      def follow_users(users_to_follow)
        begin
          client.follow(users_to_follow)
        rescue ::Twitter::Error::ServerError
          # This error will be raised if Twitter is temporarily unavailable.
          retry
        end
      end

      protected

      attr_reader :client

    end
  end
end
