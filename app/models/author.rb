class Author < ApplicationRecord
has_many :books

  validates :name, presence: true, length: { minimum: 2, maximum: 32 }
  validates :birth, presence: true, format: { with: /\d{4}-\d{2}-\d{2}/, :message => "should be in format: yyyy-mm-dd" }

end
