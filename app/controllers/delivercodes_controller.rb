class DelivercodesController < ApplicationController
  before_action :check_auth
  def index
    @delivercodes = Delivercode.all.paginate(:page => params[:page], :per_page => 15)
    if params[:search]
      @delivercodes = @delivercodes.where('name like ? or comcode like ?',"%#{params[:search]}%","%#{params[:search]}%")
    end
  end

end
