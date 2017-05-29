class WikidataItemsToLectureContent < ApplicationRecord
  belongs_to :wikidata_item
  belongs_to :lecture_content
end
