class PostcodeSearchController < ApplicationController
    def new
        @search = Search.new
    end

    def create
        @search = Search.new(postcode_search_params)

        if @search.valid?
            @results = @search.results
            @data_length = @search.data_length
        end
        render 'new'
    end

    private
    
    def postcode_search_params
        params.require(:search).permit(:input)
    end
end