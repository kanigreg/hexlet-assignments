class Task < ApplicationRecord
  validates :name, :status, :creator, :performer, presence: true
end
