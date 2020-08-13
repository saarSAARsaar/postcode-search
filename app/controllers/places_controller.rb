class PlacesController < ApplicationController
    def show
        @place = Place.find(params[:id])
    end 

    def edit
        @place = Place.find(params[:id])
    end

    def update 
        @place = Place.find(params[:id])
       
        if @place.update(places_params)
          redirect_to @place
        else
          render 'edit'
        end
    end

    private

    def places_params
        params.require(:place).permit(:postcode, :description)
    end
end
