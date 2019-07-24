class User < ApplicationRecord
  #Timeline Start
  #アソシエーション(1:多)
  has_many :sentences
  has_many :reactions,dependent: :destroy
  has_many :reacted_sentences, through: :reactions, source: :sentence
  has_many :chat_messages
  has_many :chat_room_users

  validates :name, presence: true
  validates :email, presence: true
  validates :encrypted_password, presence: true

  def already_reacted?(sentence)
    self.reactions.exists?(sentence_id: sentence.id)
  end


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


end
