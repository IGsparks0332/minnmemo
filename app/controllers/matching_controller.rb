class MatchingController < ApplicationController
  def index
    got_reaction_user_ids = Reaction.where(sentence_id: Sentence.where(user_id: current_user.id).ids, like_id: 1).pluck(:user_id)
    match_sentences_from_currentuser = Reaction.where(user_id: current_user.id , sentence_id: Sentence.where(user_id: got_reaction_user_ids),like_id: 1).map(&:sentence_id)
    @match_users = User.where(id: Sentence.where(id: match_sentences_from_currentuser).map(&:user_id))
    @got_reaction_users_sentences = Sentence.where(user_id: current_user.id).map(&:id)
  end
end
