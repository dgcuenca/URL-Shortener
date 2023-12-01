class Link < ApplicationRecord
  #in order to reuse it
  scope :recent_first, -> { order(created_at: :desc)}

  validates :url, presence: true

  # to_param is a inbuild method of rails that give you the id here we are overwriting it
  def to_param
    ShortCode.encode(id)
  end

end
