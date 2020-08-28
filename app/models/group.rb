class Group < ApplicationRecord
  belongs_to :user
  has_many :expenses
  has_one_attached :icon
end
