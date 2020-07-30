class Search 
    include ActiveModel::Model

    attr_accessor(
        :input,
        :data_length
    )

    validates :input, presence: true

    def results
        @data_length = Place.count
        
        if /\A\d+\z/.match(@input) 
            Place.where(postcode: @input)
        else
            Place.where("name LIKE ?", "%#{@input}%")
        end  
    end
end