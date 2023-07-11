class Hpo < ApplicationRecord
  belongs_to :frequency

  has_and_belongs_to_many :disorder
end
