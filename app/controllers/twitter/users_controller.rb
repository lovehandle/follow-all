class Twitter::UsersController < Twitter::BaseController

  before_filter :set_lists!, only: [ :lists ]
  before_filter :set_users!, only: [ :follow_users ]

  respond_to :json

  def lists
    respond_with @lists
  end

  def follow_users
    begin
      @new_friends = TwitterUser.follow_users(client, @users)
     
      respond_to do |format|
        format.json { render json: notice, success: true }
      end

    rescue Twitter::Error::BadRequest
      error = "You have been rate limited by Twitter. Please try again in an hour."
      respond_to do |format|
        format.json { render json: { error: error }, status: 422 }
      end
    end
  end

  protected

  def set_lists!
    @lists = TwitterUser.lists(client, params.fetch(:user, "").tr("@",""))
  end

  def set_users!
    @users = params.fetch(:users, [])
  end

end
