require 'csv'

data_path = "/Users/sarthakarora/Downloads/plz_verzeichnis_v2.csv"

rows = CSV.parse(File.read(data_path), headers: true, col_sep: ";")
places = rows.map do |row|
    Place.new(postcode: row["postleitzahl"], name: row["ortbez18"], canton: row["kanton"]).save
end
