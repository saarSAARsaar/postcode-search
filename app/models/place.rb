class Place
    attr_reader :name, :postcode, :canton

    def initialize(postcode, name, canton)
        @postcode = postcode
        @name = name
        @canton = canton
    end 
end