class PastQuestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_past_question, only: [:show, :start]

  def index
    @past_questions = PastQuestion.all
  end

  def show
    @past_question = PastQuestion.find(params[:id])
  end

  def start
    # スタートボタンが押されたときの処理を追加
    # 例えば、過去問を始めるためのセッションやデータの初期化を行う

    redirect_to past_question_path(params[:id])
  end

  def answer
    # 回答の処理を行う
    selected_option = params[:selected_option]
    correct_option = @past_question.correct_option
    is_correct = (selected_option == correct_option)
    user_attempt = current_user.user_past_question_attempts.new(
      past_question: @past_question,
      selected_option: selected_option,
      is_correct: is_correct,
      answered_at: Time.now
    )
    user_attempt.save

    if is_correct
      # 正解した場合、スコアを加算する（例: ユーザーテーブルにスコアのカラムがあると仮定）
      current_user.update(score: current_user.score + 1)
    end
    # 次の問題のIDを取得
    next_question_id = @past_question.id + 1

    # 次の問題が存在するかを確認
    if PastQuestion.exists?(next_question_id)
      redirect_to past_question_path(next_question_id)
    else
      # もし次の問題が存在しない場合、適切な処理を行う（例: 結果画面に遷移する）
      redirect_to result_path
    end
  end

  private

  def set_past_question
    @past_question = PastQuestion.find(params[:id])
  end
end
