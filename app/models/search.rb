class Search 
    include ActiveModel::Model

    attr_accessor(
        :input,
        :data_length
    )

    validates :input, presence: true

    def results
        
        
        @data_length = Place.count
        
        places = []
        if /\A\d+\z/.match(@input) 
            places = Place.where(postcode: @input)
        else
            places = Place.where("name LIKE ?", "%#{@input}%")
        end  

        places
    end
end