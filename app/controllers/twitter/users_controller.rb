class Twitter::UsersController < Twitter::BaseController

  respond_to :json

  before_filter :set_user!, only: [ :lists ]

  def lists
    begin
      @lists = Twitter.lists(@user) || []
    rescue Twitter::Error::NotFound
      @lists = []
    end

    respond_with @lists
  end

  def follow_all
    @users = params.fetch(:users, {}).values

    begin
      @user        = FollowAll::Twitter::User.new(client)
      @new_friends = @user.follow_users(@users)

      respond_to do |format|
        if @new_friends.size.zero?
          format.json { render json: { notice: "You are alread following", success: true } }
        elsif @new_friends.size == 1
          format.json { render json: { notice: "You are now following 1 new person", success: true } }
        else
          format.json { render json: { notice: "You are now following #{ @new_friends.size } new people", success: true } }
        end
      end
    rescue Twitter::Error::BadRequest
      respond_to do |format|
        format.json { render json: { error: "You have been rate limited by Twitter. Please try again in an hour." }, status: 422 }
      end
    end
  end

  protected

  def set_user!
    @user = params.fetch(:user, "").tr("@", "")
  end

end
