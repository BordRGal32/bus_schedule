class LinesController < ApplicationController
def index
    @lines = Line.all
    @line = Line.new
  end
  def create
    @line = Line.new(line_params)
    if @line.save
      redirect_to "/"
    else
      @lines = Line.all
      index
    end
  end
  def show
    @line = Line.find(params[:id])
  end
  def update
      @line = Line.find(params[:id])
      if params[:station_ids] != nil
        stations = params[:station_ids]
        stations.each do |id|
          station = Station.find(id)
          @line.stations << station
        end
      end
      if params[:station_delete_ids] != nil
        delete_stations = params[:station_delete_ids]
        delete_stations.each do |id|
          station = Station.find(id)
          @line.stations.delete(station)
        end
      end
    if @line.update(line_params)
      redirect_to line_path
    else
      show
    end
  end
  def destroy
    @line = Line.find(params[:id])
    @line.destroy
    @lines = Line.all
    redirect_to('/')
  end

private
  def line_params
    params.require(:line).permit(:name)
  end
end
