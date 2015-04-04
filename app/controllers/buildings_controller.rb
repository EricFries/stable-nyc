class BuildingsController < ApplicationController

  def new
    @building = Building.new
  end

  def index
  end

  #Create a new building object based on the user input in order to render the view.  It is not saved to the database.
  def create
    @building = Building.find_by(building_params)

    if !@building 
      @building = Building.new(building_params)
    end
    render 'show'
  end

  #Buildings with zipcodes are in the database since the form does not prompt the user to provide a zip
  def in_database?
    !!@building.zip
  end
  helper_method :in_database?


  private
  def building_params
    params.require(:building).permit(:building_num, :street, :street_suffix)
  end

end
