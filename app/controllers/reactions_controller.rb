class ReactionsController < ApplicationController
    
    before_action :authenticate_user!
    
    def create
        @reaction = current_user.reactions.create(sentence_id: params[:sentence_id],like_id: params[:like_id])
        redirect_back(fallback_location: sentences_path)
    end
    
    def show
      @user= User.find(params[:id])
      @sentences=Sentence.where(user_id:current_user.id)
      @reacted_sentences = @user.reacted_sentences
      @liked_sentences = @reacted_sentences.where(like_id:1)
    end
end
