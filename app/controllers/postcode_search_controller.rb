class PostcodeSearchController < ApplicationController
  def create
    @username = current_user.username
    @email = current_user.email
    @search = Search.new(postcode_search_params)
    @cantons = Place.all.pluck(:canton).uniq.append("All")
    
    if @search.valid?
      @results = @search.results
      @data_length = @search.data_length
      @input = postcode_search_params[:input]
    end
    @canton = postcode_search_params[:canton]

    render 'places/index', locals: { results: @results, data_length: @data_length }
  end

  private

  def postcode_search_params
    params.require(:search).permit(:input, :canton)
  end
end
