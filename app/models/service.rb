class Service < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many_attached :photos
  validate :end_date_after_start_date

  include PgSearch::Model
  pg_search_scope :search_by_title_and_description,
    against: [ :title, :description ],
    using: {
      tsearch: { prefix: true }
    }

  private

  def end_date_after_start_date
    unless start_at.nil?
      if end_at < start_at
        errors.add(:end_at, "must be after the start date")
      end
    end
  end
  
end
