class RestaurantsController < ApplicationController
    before_action :get_place

    def index
        @restaurants = @place.restaurants
    end

    def show
        
    end

    private

    def get_place
        @place = Place.find(params[:place_id])
    end

    def restaurant_params
        params.require(:restaurant).permit(:name, :adress, :place_id)
    end
end
