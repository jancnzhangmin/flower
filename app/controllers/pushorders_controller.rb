class PushordersController < ApplicationController
  def index
    mydate = Time.now.strftime('%Y-%m-%d')
    if params[:date]
      mydate = Date.parse(params[:date]).strftime('%Y-%m-%d')
    end
    redirect_to today_pushorders_path(date:mydate)
  end

  def today
    if params[:date] && params[:date].to_s.size > 0
      mydate = Date.parse(params[:date])
      @pushorders = Pushorder.where('created_at between ? and ?', mydate.beginning_of_day, mydate.end_of_day)
    else
      @pushorders = Pushorder.where('created_at between ? and ?', Time.now.beginning_of_day, Time.now.end_of_day)
    end
  end

  def upday
    mydate = Time.now
    if params[:date] && params[:date].to_s.size > 0
      mydate = Date.parse(params[:date])
    end
    mydate = mydate - 1.days
    @pushorders = Pushorder.where('created_at between ? and ?', mydate.beginning_of_day, mydate.end_of_day)
    redirect_to today_pushorders_path(date:mydate)
  end

  def nextday
    mydate = Time.now
    if params[:date] && params[:date].to_s.size > 0
      mydate = Date.parse(params[:date])
    end
    if mydate.beginning_of_day < Time.now.beginning_of_day
      mydate = mydate + 1.days
    end
    @pushorders = Pushorder.where('created_at between ? and ?', mydate.beginning_of_day, mydate.end_of_day)
    redirect_to today_pushorders_path(date:mydate)
  end

end
