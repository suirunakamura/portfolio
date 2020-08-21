class ArticlesController < ApplicationController
  def new
    @article =  Article.new(blogs_params)
  end

  def create
    # ストロングパラメータから精査されたデータだけをインスタンスに格納
    @article.create
    # インスタンスに保存成功した場合の処理
    if @article.save
      flash[:success] ="ユーザーを登録しました"
      redirect_to "/"

    # インスタンスの保存に失敗した場合の処理
    else
      flash[:danger] = "ユーザーの登録に失敗しました"
      render :new
    end
  end

  private
  def blogs_params
    params.permit(:dating, :title, :text)
  end
end
