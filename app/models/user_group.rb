class UserGroup < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :group, dependent: :destroy

  validates_presence_of :user, :group
  validates_uniqueness_of :user, scope: [:group]
end
