class SentencesController < ApplicationController

    before_action :authenticate_user!

  def new
   @sentence = Sentence.new
  end

  def create
   @sentence = Sentence.new(sentence_params)
   @sentence.user = current_user
   if @sentence.save
     redirect_to :action => "index"
   else
     redirect_to :action => "new"
   end
  end


  def index
    @s=2
    @sentence = Sentence.find_by(id: @s)
    begin
        while @sentence.user_id == current_user.id || current_user.already_reacted?(@sentence) || @sentence.suspicious == true do
            @s = @s+1
            @sentence = Sentence.find_by(id: @s)
        end
    rescue NoMethodError
        @sentence= Sentence.find_by(id: 1)
    end
  end
    ######遺産#####
    #@s=2
    #@sentence = Sentence.find_by(id: @s)
    #@check=Reaction.find_by(sentence_id: @sentence.id , user_id: current_user.id)

    #begin
    #    until @check.blank? do
    #        @s = @s+1
    #        @sentence = Sentence.find_by(id: @s)
    #        @check=Reaction.find_by(sentence_id: @sentence.id, user_id: current_user.id)
    #    end

    #    while @sentence.user_id == current_user.id do
    #        @s = @s+1
    #        @sentence = Sentence.find_by(id: @s)
    #    end
    #rescue NoMethodError
    #    @sentence= Sentence.find_by(id: 1)
    #end
    #############

  def destroy
    Sentence.find(params[:id]).destroy
    redirect_to :back
  end

  def show
    @sentence = Sentence.find_by(id: params[:id])
    items = RakutenWebService::Ichiba::Item.search(:keyword => @sentence.title ) # This returns Enamerable object
    @items = items.where(genre_id: 101931)
  end

  def edit
    @sentence = Sentence.find_by(id: params[:id])
  end

  def update
    @sentence = Sentence.find_by(id: params[:id])
    if @sentence.update(sentence_params)
      redirect_to action: "index"
    else
      redirect_to action: "edit"
    end
  end

    private
#セキュリティのため、許可した:bodyというデータだけ取ってくるようにする
  def sentence_params
    params.require(:sentence).permit(:body,:title,:author,:publisher,:page,:plus)
  end



end
