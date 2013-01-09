class Twitter::UsersController < Twitter::BaseController

  respond_to :json

  before_filter :set_user!, only: [ :lists ]

  def lists
    @lists = Twitter.lists(@user)
    respond_with @lists
  end

  protected

  def set_user!
    @user = params.fetch(:user, "").tr("@", "")
  end

end
