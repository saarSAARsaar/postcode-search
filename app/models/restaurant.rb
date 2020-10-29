class Restaurant < ApplicationRecord
  belongs_to :place

  validates :name, :address, presence: true
end
