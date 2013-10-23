class SessionsController < ApplicationController
  include ApplicationHelper

  def twitter
    @user = current_user || User.first_or_create(twitter_token: token, twitter_secret: secret) {|user| user.name = name }
    @user.update_attributes(twitter_token: token, twitter_secret: secret)

    session[:remember_token] = @user.create_remember_token

    redirect_to root_path
  end

  def fitbit
    @user = current_user || User.first_or_create(token: token, secret: secret) {|user| user.name = name }
    @user.update_attributes(token: token, secret: secret)

    session[:remember_token] = @user.create_remember_token

    redirect_to root_path
  end

  private

  def name
    request.env['omniauth.auth'].info.name
  end

  def token
    request.env['omniauth.auth'].try(:credentials).try(:token)
  end

  def secret
    request.env['omniauth.auth'].try(:credentials).try(:secret)
  end
end
