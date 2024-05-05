class ListsController < ApplicationController
  def new
    @list=List.new
  end

  def create
    list=List.new(list_params)
    if @list.save
      flash[:notice] = "投稿に成功しました。"
    　redirect_to list_path(list.id)
    else
      flash[:notice] = "投稿に失敗しました。"
      render :new
    end
  end

  def index
    @lists=List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
    @list=List.find(params[:id])
  end


  def destroy
    list = List.find(params[:id])
    if list.destroy
      flash[:notice] = "リストを削除しました。" # 削除が成功した場合にフラッシュメッセージを設定
    else
      flash[:alert] = "リストの削除に失敗しました。" # 削除が失敗した場合にフラッシュメッセージを設定
    end
    redirect_to list_path(@list.id)
  end

  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to list_path(list.id)
  end

  private

  def list_params
    params.require(:list).permit(:title, :body, :image)
  end
end