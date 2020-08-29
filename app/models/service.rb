class Service < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many_attached :photos
  validate :start_date_cannot_be_in_the_past

  include PgSearch::Model
  pg_search_scope :search_by_title_and_description,
    against: [ :title, :description ],
    using: {
      tsearch: { prefix: true }
    }

  def start_date_cannot_be_in_the_past
    if start_at.present? && start_at < Date.today
      errors.add(:start_at, "can't be in the past")
    end
  end
  
end
