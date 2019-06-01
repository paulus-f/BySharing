class Rent < ApplicationRecord
  belongs_to :bicycle
  belongs_to :user
end
