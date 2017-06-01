class WikidataItemsToLectureContent < ApplicationRecord
  belongs_to :wikidata_item, dependent: :destroy
  belongs_to :lecture_content, dependent: :destroy

  validates_presence_of :wikidata_item, :lecture_content
end
