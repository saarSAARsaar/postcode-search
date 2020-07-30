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
            
            Place.all
        elsif /\A\d+\z/.match(@input) 
            Place.where(postcode: @input, canton: @canton)
        else
            Place.where("name LIKE ?", "%#{@input}%").where(canton: @canton)
            
        end  
    end
end