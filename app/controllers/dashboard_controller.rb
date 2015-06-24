class DashboardController < ApplicationController
  def index
    @client = Jawbone::Client.new session[:token]

    @user = @client.user
    @moves = @client.moves({:start_time => 7.days.ago.to_i, :end_time => 1.day.from_now.to_i})["data"]["items"]
    @up_meals = @client.meals["data"]["items"]
    @up_meals2 = @client.meals({:start_time => 7.days.ago.to_i, :end_time => 1.day.from_now.to_i})["data"]["items"]

    @calories_burnt = {}

    @moves.each do |item|
      previous = @calories_burnt[item["date"]] || 0
      @calories_burnt[item["date"]] = previous + item["details"]["bg_calories"]
    end

    @meals = {}

    @up_meals.each do |item|
      previous = @meals[item["date"]] || 0
      @meals[item["date"]] = previous + item["details"]["calories"]
    end
    @up_meals2.each do |item|
      previous = @meals[item["date"]] || 0
      @meals[item["date"]] = previous + item["details"]["calories"]
    end

    @meals = @meals.sort_by {|k,v| k}.reverse
    @meal_dates = @meals.map{|k,v| k}
    @meal_calories = @meals.map{|k,v| v}
  end
end
