class Twitter::ListsController < Twitter::BaseController

  respond_to :json

  def users
    @list  = FollowAll::Twitter::List.new(client, params[:user], params[:list])
    @users = @list.users

    respond_with @users
  end

end
