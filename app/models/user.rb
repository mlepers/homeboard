class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :services, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :messages
  belongs_to :residence
  has_one_attached :photo

  include PgSearch::Model
  pg_search_scope :search_by_first_name_last_name_and_pseudo,
    against: [ :first_name, :last_name, :pseudo ],
    using: {
      tsearch: { prefix: true }
    }

  def name
    first_name + " " + last_name
  end
end
