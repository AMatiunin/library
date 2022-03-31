class Book < ApplicationRecord
  # include Elasticsearch::Model
  # include Elasticsearch::Model::Callbacks

  # settings index: { number_of_shards: 1 } do
  #   mapping dynamic: false do
  #     indexes :title, analyzer: 'english'
  #     indexes :author_id, type: :integer
  #   end
  # end

  def self.search(query)
    __elasticsearch__.search(
      {
        query: {
          multi_match: {
            query: query,
            fields: ['title^5', 'body']
          }
        },
        highlight: {
          pre_tags: ['<mark>'],
          post_tags: ['</mark>'],
          fields: {
            title: {},
            body: {},
          }
        },
        suggest: {
          text: query,
          title: {
            term: {
              size: 1,
              field: :title
            }
          },
          body: {
            term: {
              size: 1,
              field: :body
            }
          }
        }
      }
    )
  end

  def as_indexed_json(options = nil)
    self.as_json(only: [:title, :author])
  end

  belongs_to :author
  validates :title, presence: true, length: { minimum: 2, maximum: 256 }
  validates :published, presence: true, length: { is: 4 }
end
