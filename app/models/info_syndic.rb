class InfoSyndic < ApplicationRecord
  validates :category, inclusion: { in: ["alert", "info"] } 
  belongs_to :residence

  def seen!
    self.seen = true
  end

end
