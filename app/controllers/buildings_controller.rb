class BuildingsController < ApplicationController

  def new
    @building = Building.new
  end

  def index
  end

  #Create a new building object based on the user input in order to render the view.  It is not saved to the database.
  # :street in building_params needs to be upcase to match the database records (which are all upcased)
  def create
    search = building_params
    search[:street] = search[:street].upcase
    @building = Building.find_by(search)

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

  #The Queens office is an edge case because it uses the neighborhood Jamaica as its city name.
  def get_office
    @office = Office.find_by(:city => "BROOKLYN")
    #Add this logic in when the other boroughs are added to the DB.
    # if params[:building][:borough] == "Queens"
    #   @office = Office.find_by(:city => "JAMAICA")
    # else
    #   @office = Office.find_by(:city => params[:building][:borough].upcase)
    # end
  end
  helper_method :get_office


  private
  def building_params
    params.require(:building).permit(:building_num, :street, :street_suffix)
  end

end
