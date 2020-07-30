class PostcodeSearchController < ApplicationController
    def new
        @search = Search.new
        @results = @search.results
        @cantons = Place.all.pluck(:canton).uniq
    end

    def create
        @search = Search.new(postcode_search_params)
        @cantons = Place.all.pluck(:canton).uniq

        if @search.valid?
            @results = @search.results
            @data_length = @search.data_length
        end
        
        render 'new'
    end

    private

    def postcode_search_params
        params.require(:search).permit(:input, :canton)
    end
end