class InfoSyndic < ApplicationRecord
  validates :category, inclusion: { in: ["alert", "info"] } 
  belongs_to :residence
  belongs_to :user

  def seen!
    self.seen = true
  end

end
