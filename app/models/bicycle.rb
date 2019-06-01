class Bicycle < ApplicationRecord
  has_many :rents
  belongs_to :user
  belongs_to :manufacturer
end
