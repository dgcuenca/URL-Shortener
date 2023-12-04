class Link < ApplicationRecord
  # so if we destroy the link we delete the associate views
  has_many :views, dependent: :destroy

  #in order to reuse it
  scope :recent_first, -> { order(created_at: :desc)}

  validates :url, presence: true

  # to_param is a inbuild method of rails that give you the id here we are overwriting it
  def to_param
    ShortCode.encode(id)
  end

  # here also we are overwriting a inbuild metho of rails
  def self.find(id)
    super ShortCode.decode(id)
  end
end
