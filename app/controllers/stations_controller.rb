class StationsController < ApplicationController
  def index
    @stations = Station.all
    @station = Station.new
  end
  def create
    @station = Station.new(station_params)
    if @station.save
      redirect_to "/"
    else
      @stations = Station.all
      render('stations/index.html.erb')
    end
  end

private
  def station_params
    params.require(:station).permit(:name)
  end
end
