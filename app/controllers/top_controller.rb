class TopController < ApplicationController
  before_action :authenticate_user!
  def index
    @like_all = Reaction.where(like_id:1)
    @rank = Sentence.find(@like_all.group(:sentence_id).order('count(sentence_id) desc').limit(10).pluck(:sentence_id))
  end
end
