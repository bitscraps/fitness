class DashboardController < ApplicationController
  def index
    @client = Jawbone::Client.new session[:token]

    @user = @client.user
  end
end
