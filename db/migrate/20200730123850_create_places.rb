class CreatePlaces < ActiveRecord::Migration[6.0]
  def change
    create_table :places do |t|
      t.string :name
      t.string :postcode
      t.string :canton

      t.timestamps
    end
  end
end
