class Residence < ApplicationRecord
    has_many :users
    has_many :info_syndics
end
