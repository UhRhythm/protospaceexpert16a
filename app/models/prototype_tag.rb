class PrototypeTag < ActiveRecord::Base
  belongs_to :prototype
  belongs_to :tag
  validates  :prototype_id, presence: true
  validates  :tag_id, presence: true
end
