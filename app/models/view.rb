class View < ApplicationRecord
  #any time we create a view we go an update the views_count on the links table
  belongs_to :link, counter_cache: true
end
