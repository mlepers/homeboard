class Service < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many_attached :photos

  include PgSearch::Model
  pg_search_scope :search_by_title_and_description,
    against: [ :title, :description ],
    using: {
      tsearch: { prefix: true }
    }

end
