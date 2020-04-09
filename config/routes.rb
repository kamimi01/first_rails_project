Rails.application.routes.draw do
  # トップページの/にアクセスした時のルーティング
  root to: 'messages#index'

  # これを書くだけで、上で書いたのと同じルーティングになる
  # indexはトップページで使い、アクションとしては使わないので、exceptで除外する
  resources :messages, except: [:index]

#   Prefix Verb   URI Pattern                  Controller#Action
#   messages GET    /messages(.:format)          messages#index
#            POST   /messages(.:format)          messages#create
# new_message GET    /messages/new(.:format)      messages#new
# edit_message GET    /messages/:id/edit(.:format) messages#edit
#    message GET    /messages/:id(.:format)      messages#show
#            PATCH  /messages/:id(.:format)      messages#update
#            PUT    /messages/:id(.:format)      messages#update
#            DELETE /messages/:id(.:format)      messages#destroy
end
