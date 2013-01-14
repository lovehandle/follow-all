class Twitter::SessionsController < ApplicationController

  before_filter :set_access_token!,  only: [ :create ]
  before_filter :set_access_secret!, only: [ :create ]

  def create
    redirect_to twitter_show_path, notice: "Signed in"
  end

  def show
    if session[:access_token] && session[:access_secret] 
      @user = client.user
    else
      redirect_to twitter_failure_path
    end
  end

  def error
    flash[:error] = "Sign in with Twitter failed"
    redirect_to root_path
  end

  def destroy
    reset_session
    redirect_to root_path, notice: "Signed out"
  end

  protected

  def set_access_token!
    session[:access_token]  = request.env['omniauth.auth']['credentials']['token']
  end

  def set_access_secret!
    session[:access_secret] = request.env['omniauth.auth']['credentials']['secret']
  end

end
