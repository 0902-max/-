class TopController < ApplicationController
  before_action :authenticate_user!
  #before_action :require

  def index
    # 何か処理
  end

  private

  def require
    # 質問に対する回答を取得
    answer = current_user.choices.find_by(user_choice: 'Your Answer')

    if answer
      # 質問に回答がある場合はtop_indexにリダイレクト
      redirect_to top_index_path
    else
      # 質問に回答がない場合はfirst_pageにリダイレクト
      redirect_to first_page_path
    end
  end
end

#ファラでい gem HTTPを使用して