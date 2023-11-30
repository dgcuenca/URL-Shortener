class Link < ApplicationRecord
  #in order to reuse it
  scope :recent_first, -> { order(created_at: :desc)}

  validates :url, presence: true
end
