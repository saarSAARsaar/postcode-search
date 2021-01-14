class PlacesController < ApplicationController
  before_action :set_place, except: %i[index]
  before_action :authenticate_user!

  def index
    @username = current_user.username
    @email = current_user.email
    @search = Search.new
    @user_mailer = UserMailer.new
    @results = @search.results
    @data_length = @search.data_length
    @cantons = Place.all.pluck(:canton).uniq.unshift("All") 
  end

  def update 
    if @place.update(places_params)
      redirect_to @place
    else
      render 'edit'
    end
  end


  private

  def set_place
    @place = Place.find(params[:id])
  end

  def places_params
    params.require(:place).permit(:postcode, :description)
  end
end
