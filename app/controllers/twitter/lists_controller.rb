class Twitter::ListsController < Twitter::BaseController
  USERS = {
    "fellows-2011" => [
      { name: "Erik Michaels-Ober", screen_name: "sferik", url: "http://twitter.com/sferik"  },
    ],

    "fellows-2012" => [
      { name: "Ben Sheldon", screen_name: "bensheldon", url: "http://twitter.com/bensheldon"  },
    ],

    "fellows-2013" => [
      { name: "Ryan Closner", screen_name: "rclosner", url: "http://twitter.com/rclosner"  },
    ],

    "staff" => [
      { name: "Jennifer Pahlka", screen_name: "pahlkadot", url: "http://twitter.com/pahlkadot"  },
    ]
  }
  
  def index
    respond_to do |format|
      format.js { render json: TWITTER_LISTS }
    end
  end

  def follow
    respond_to do |format|
      format.js { render json: { success: true } }
    end
  end

  def users
    users_params = params[:users]

    if users_params[:user] && users_params[:list]
      @users = []
      500.times do |i|
        @users << USERS[users_params[:list]].first
      end
    end

    respond_to do |format| 
      format.js { render json: @users }
    end
  end
end
