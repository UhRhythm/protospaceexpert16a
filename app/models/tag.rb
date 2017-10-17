class Tag < ActiveRecord::Base
  validates :name, precence: true
  has_many :prototypes, through: :prototype_tags
  has_many :prototype_tags, dependent: :destroy
end
