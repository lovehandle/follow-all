class Twitter::ListsController < Twitter::BaseController

  before_filter :set_users!, only: [ :users ]

  respond_to :json

  def users
    respond_with @users
  end

  protected

  def set_users!
    @users = TwitterList.users(client, params.fetch(:user, ""), params.fetch(:list, ""))
  end

end
