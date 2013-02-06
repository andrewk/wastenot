class LocationsController < ApplicationController
  def find
    results = Geocoder.search([params[:latitude],params[:longitude]])
    if geo = results.first
      @response = { "address" => geo.address }.to_json
    else
      @response = { "error" => "Could not determine your location" }.to_json
    end

    render :json => @response 
  end
end
