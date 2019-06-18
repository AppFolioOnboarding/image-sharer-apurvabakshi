class Image < ApplicationRecord
  acts_as_taggable_on :tags
end
