class Restaurant < ApplicationRecord
<<<<<<< HEAD
    belongs_to :place

=======
>>>>>>> 1b818e97dbefb7fc51efc46f6ccb8aa624a2cb90
    validates :name, :address, presence: true
end
