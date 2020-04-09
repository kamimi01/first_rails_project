class MessagesController < ApplicationController
  #   Prefix Verb   URI Pattern                  Controller#Action
  #   messages GET    /messages(.:format)          messages#index
  #            POST   /messages(.:format)          messages#create
  # new_message GET    /messages/new(.:format)      messages#new
  # edit_message GET    /messages/:id/edit(.:format) messages#edit
  #    message GET    /messages/:id(.:format)      messages#show
  #            PATCH  /messages/:id(.:format)      messages#update
  #            PUT    /messages/:id(.:format)      messages#update
  #            DELETE /messages/:id(.:format)      messages#destroy

  def index
    @messages = Message.all
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      flash[:success] = 'Messageが正常に投稿されました'
      redirect_to @message
    else
      flash.now[:danger] = 'Messageが投稿されませんでした'
      render :new
    end
  end

  def new
    @message = Message.new
  end

  def edit
    @message = Message.find(params[:id])
  end

  def show
    @message = Message.find(params[:id])
  end

  def update
    @message = Message.find(params[:id])

    if @message.update(message_params)
      flash[:success] = 'Messageは正常に更新されました'
      redirect_to @message
    else
      flash.now[:danger] = 'Messageは更新されてませんでした'
      render :edit
    end
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy

    flash[:success] = 'Messageは正常に削除されました'
    redirect_to root_url
  end

  private

  # Strong Parameter
  def message_params
    params.require(:message).permit(:content)
  end

end
