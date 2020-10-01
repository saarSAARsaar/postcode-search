class RestaurantsController < ApplicationController
    before_action :get_place
    before_action :get_restaurant, only: %i[edit update destroy]

    def index
        @restaurants = @place.restaurants
    end

    def show

    end

    def new
        @restaurant = @place.restaurants.new()
    end

    def create
        @restaurant = @place.restaurants.new(restaurant_params)
        if @restaurant.save
          flash[:notice] = 'Restaurant has been created'
          redirect_to place_restaurants_path(@place)
        else
          render :new
        end
    end

    def edit
    end

    def update
      if @restaurant.update(restaurant_params)
        redirect_to place_restaurants_path(@place), notice: 'Restaurant has been edited'
      else
        render :edit
      end
    end

    def destroy
      @place = get_place()
      get_restaurant().destroy

      redirect_to @place
    end

    private

    def get_place
      @place = Place.find(params[:place_id])
    end

    def get_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    def restaurant_params
        params.require(:restaurant).permit(:name, :address, :place_id)
    end
end
