class Search 
    include ActiveModel::Model

    attr_accessor(
        :input,
        :canton,
        :data_length
    )

    def results
        @data_length = Place.count
        
        if @input.blank? 
            return_places = Place.all 
        elsif /\A\d+\z/.match(@input) 
            return_places = Place.where(postcode: @input)
        else
            return_places = Place.where("name LIKE ?", "%#{@input}%")
        end  

        if @canton != "All" && @canton
            return_places = return_places.where(canton: @canton)
        end

        return_places.order(:name)
    end
end                         