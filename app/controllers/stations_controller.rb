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
      index
    end
  end
  def show
    @station = Station.find(params[:id])
  end
  def update
    @station = Station.find(params[:id])
    if @station.update(station_params)
      redirect_to station_path
    else
      show
    end
  end
  def destroy
    @station = Station.find(params[:id])
    @station.destroy
    @stations = Station.all
    redirect_to('/')
  end

private
  def station_params
    params.require(:station).permit(:name)
  end
end
