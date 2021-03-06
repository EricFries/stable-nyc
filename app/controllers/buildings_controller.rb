class BuildingsController < ApplicationController

  def new
    @building = Building.new
  end

  def index
  end

  def search
    params[:street] = params[:street].upcase
    params[:street_suffix] = params[:street_suffix].upcase
    @building = Building.find_by(:building_num => params[:building_num], :street => params[:street], :street_suffix => params[:street_suffix])
    if !@building 
      @building = Building.new(:building_num => params[:building_num], :street => params[:street], :street_suffix => params[:street_suffix])
    end
    respond_to do |format|
      format.js { render :show }
      format.html { render :show }
    end
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
