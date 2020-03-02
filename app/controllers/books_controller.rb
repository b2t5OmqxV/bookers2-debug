class BooksController < ApplicationController
  before_action :baria_user, only: [:edit]
  # editを追加しましょう！！＃
  def show
    @book  = Book.new
    @books = Book.find(params[:id])
    @user = @books.user
    # 不足している変数を追記！！#
  end

  def index
  	@books = Book.all #一覧表示するためにBookモデルの情報を全てくださいのall
    @book = Book.new
    # 新規投稿用のbookの変数がなかった！！#
  end

  def create
  	@book = Book.new(book_params) #Bookモデルのテーブルを使用しているのでbookコントローラで保存する。
    @books = Book.all
    @book.user = current_user
    # 不足している変数を追記！！#
  	if @book.save #入力されたデータをdbに保存する。
  		redirect_to @book, notice: "successfully created book!"#保存された場合の移動先を指定。
  	else
  		render 'index'
  	end
  end

  def edit
  	@book = Book.find(params[:id])
  end

  def update
  	@book = Book.find(params[:id])
  	if @book.update(book_params)
  		redirect_to @book, notice: "successfully updated book!"
  	else #if文でエラー発生時と正常時のリンク先を枝分かれにしている。
  		render "edit"
  	end
  end

  def destroy
    # スペルミス！！#
  	@books = Book.find(params[:id])
  	@books.destroy
    # スペルミス！！#
  	redirect_to books_path, notice: "successfully delete book!"
  end

  private
  def baria_user
    @book = Book.find(params[:id])
    @user = @book.user
    if @user != current_user
    redirect_to books_path
    end
  end
  #url直接防止　メソッドを自己定義してbefore_actionで発動。#

  def book_params
  	params.require(:book).permit(:title, :body, :user_id)
    # params不足してます！！＃
  end

end
