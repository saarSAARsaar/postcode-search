class PlacesController < ApplicationController
    def index
        @search = Search.new
        @results = @search.results
        @data_length = @search.data_length
        @cantons = Place.all.pluck(:canton).uniq.append("All")
    end

    def show
        @place = get_place()
    end 

    def edit
        @place = get_place()
    end

    def update 
        @place = get_place()
       
        if @place.update(places_params)
          redirect_to @place
        else
          render 'edit'
        end
    end

    private

    def get_place
        Place.find(params[:id])
    end

    def places_params
        params.require(:place).permit(:postcode, :description)
    end
end
