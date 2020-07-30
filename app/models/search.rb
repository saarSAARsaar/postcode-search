require 'csv'

class Search 
    include ActiveModel::Model

    attr_accessor(
        :input,
        :data_length
    )

    validates :input, presence: true

    def results
        data_path = "/Users/sarthakarora/Downloads/plz_verzeichnis_v2.csv"

        rows = CSV.parse(File.read(data_path), headers: true, col_sep: ";")
        places = rows.map do |row|
            Place.new(row["postleitzahl"], row["ortbez18"], row["kanton"])
        end
        
        @data_length = places.length.to_s
        
        if /\A\d+\z/.match(@input) 
            wanted_places = places.find_all { |place| place.postcode == @input }
            return_vals = wanted_places.map { |place| ['', place.name, place.canton] }
        else
            wanted_places = places.find_all { |place| place.name == @input }
            return_vals = wanted_places.map { |place| [place.postcode, '', place.canton] }
        end  

        return_vals.uniq
        
    end
end