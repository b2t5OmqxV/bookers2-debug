class UsersController < ApplicationController
	before_action :baria_user, only: [:update,:edit]
  # editを追加しましょう！！＃

  def show
  	@user = User.find(params[:id])
  	@books = @user.books
  	@book = Book.new #new bookの新規投稿で必要（保存処理はbookコントローラー側で実施）
  end

  def index
  	@users = User.all #一覧表示するためにUserモデルのデータを全て変数に入れて取り出す。
  	@book = Book.new #new bookの新規投稿で必要（保存処理はbookコントローラー側で実施）
  end
  # endが抜けている！！#

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
    @books = @user.books
    @book = Book.new 
    # render用の変数が不足してます！！#
  	if @user.update(user_params)
  		redirect_to user_path(@user), notice: "successfully updated user!"
      # routesを確認してsに気をつけよう！！#
  	else
  		render "edit"
      # showに戻るとifの意味ない！！#
  	end
  end

  private
  def user_params
  	params.require(:user).permit(:name, :introduction, :profile_image)
  end

  #url直接防止　メソッドを自己定義してbefore_actionで発動。
   def baria_user
  	unless params[:id].to_i == current_user.id
  		redirect_to user_path(current_user)
  	end
   end

end
