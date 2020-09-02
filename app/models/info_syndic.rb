class InfoSyndic < ApplicationRecord
  validates :category, inclusion: { in: ["alert", "info"] } 
  belongs_to :residence
  belongs_to :user
  has_one_attached :file

  def seen!
    self.seen = true
  end

end
