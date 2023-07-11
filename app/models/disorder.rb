class Disorder < ApplicationRecord
  belongs_to :type
  belongs_to :group

  has_and_belongs_to_many :hpo

  scope :with_hpo_ids, lambda { |hpo_ids|
    Disorder
      .joins(:hpo)
      .where(hpos: { hpo_id: hpo_ids })
      .order('hpos.frequency_id': :desc)
      .distinct
  }
end
