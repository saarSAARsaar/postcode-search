class PostcodeSearchController < ApplicationController
    def new
        @search = Search.new
        @results = @search.results
        @cantons = Place.all.pluck(:canton).uniq.append("All")
    end

    def create
        @search = Search.new(postcode_search_params)
        @cantons = Place.all.pluck(:canton).uniq.append("All")
        
        if @search.valid?
            @results = @search.results
            @data_length = @search.data_length
            @input = postcode_search_params[:input]
        end
        @canton = postcode_search_params[:canton]

        render 'new'
    end

    private

    def postcode_search_params
        params.require(:search).permit(:input, :canton)
    end
end
