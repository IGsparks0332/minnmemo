class UsersController < ApplicationController
    before_action :authenticate_user!
    
    def show
        @user = User.find_by(id: params[:id])
        
        got_reaction_user_ids = Reaction.where(sentence_id: Sentence.where(user_id: current_user.id).ids, like_id: 1).pluck(:user_id)
        match_sentences_from_currentuser = Reaction.where(user_id: current_user.id , sentence_id: Sentence.where(user_id: got_reaction_user_ids),like_id: 1).map(&:sentence_id)
        @match_users = User.where(id: Sentence.where(id: match_sentences_from_currentuser).map(&:user_id))
    end
end
