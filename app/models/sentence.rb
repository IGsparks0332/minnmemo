class Sentence < ApplicationRecord
  #Timeline Start
  #アソシエーション(1:多)
  belongs_to :user
  has_many :reactions
  #Timeline End
end
