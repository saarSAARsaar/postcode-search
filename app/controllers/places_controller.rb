class PlacesController < ApplicationController
    def show
        @place = Place.find_by(postcode: params[:postcode])
    end
end
