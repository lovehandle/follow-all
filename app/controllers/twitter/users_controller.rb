class Twitter::UsersController < Twitter::BaseController

  respond_to :json

  before_filter :set_user!, only: [ :lists ]

  def lists
    @lists = Twitter.lists(@user)
    respond_with @lists
  end

  def follow_all
    begin
      @user  = FollowAll::Twitter::User.new(client)
      @user.follow_users(params[:users])

      respond_with(@users) do |format|
        format.json { render json: { success: true } }
      end
    rescue Twitter::Error::BadRequest
      respond_with(@users) do |format|
        format.json { render json: { error: t("help.rate_limit") }, status: 422 }
      end
    end
  end

  protected

  def set_user!
    @user = params.fetch(:user, "").tr("@", "")
  end

end
