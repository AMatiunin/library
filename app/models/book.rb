class Book < ApplicationRecord
  belongs_to :author

  validates :title, presence: true, length: { minimum: 2, maximum: 256 }
  validates :published, presence: true, length: { is: 4 }

  # scope :author, -> { author_id.name }
end
