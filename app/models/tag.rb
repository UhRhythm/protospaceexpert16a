class Tag < ActiveRecord::Base
  validates :name, presence: true
  has_many :prototypes, through: :prototype_tags
  has_many :prototype_tags, dependent: :destroy
  accepts_nested_attributes_for :prototypes
end
