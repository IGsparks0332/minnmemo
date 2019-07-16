class Reaction < ApplicationRecord
  belongs_to :sentence, class_name: "Sentence"
  belongs_to :user, class_name: "User"
end
