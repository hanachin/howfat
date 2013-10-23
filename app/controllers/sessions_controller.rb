class SessionsController < ApplicationController
  def fitbit
    render text: request.env['omniauth.auth'].info.nickname
  end
end
