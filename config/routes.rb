Rails.application.routes.draw do

  root 'homes#top'
  get 'home/about' => 'homes#about'

  devise_for :users
  resources :users,only: [:show,:index,:edit,:update]
  resources :books

end
# endがなかった！！
# 記載順序が前後していた！！
# homesで実装していない！！