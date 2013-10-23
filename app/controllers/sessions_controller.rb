class SessionsController < ApplicationController
  def callback
    render text: request.env['omniauth.auth'].info.nickname
  end
end
