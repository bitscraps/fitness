class SessionsController < ApplicationController
  def new
  end

  def create
    auth_hash = request.env['omniauth.auth']

    session[:token] = request.env["omniauth.auth"]["credentials"]["token"]

    client = Jawbone::Client.new session[:token]

    render :text => client.user
  end

  def failure
  end
end
