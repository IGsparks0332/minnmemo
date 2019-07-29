class Sentence < ApplicationRecord
  #Timeline Start
  #アソシエーション(1:多)
  belongs_to :user
  has_many :reactions
  #Timeline End
  validates :title, presence: true
  validates :body, presence: true
  validates :author, presence: true
  validates :publisher, presence: true



end
