class Wiki < ApplicationRecord
  belongs_to :user
  has_many :collaborating_users, through: :collaborators, source: :user
end
