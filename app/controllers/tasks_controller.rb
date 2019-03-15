class TasksController < ApplicationController
  # @article に値を格納するコードのリファクタリング
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    # Taskからis_displayがtrueのデータを降順で最大5件抽出(受け入れ基準3つまとめて書いてます)

    # SQLリクエスト「'is_display=?', true」について
    # SQLクエリに代入する前にidがエスケープされるため、
    # SQLインジェクション (SQL Injection) と呼ばれる深刻なセキュリティホールを避けることができます。
    # https://ja.wikipedia.org/wiki/SQL%E3%82%A4%E3%83%B3%E3%82%B8%E3%82%A7%E3%82%AF%E3%82%B7%E3%83%A7%E3%83%B3
    # 変数の時に有効だけど今回は癖づけで使ってます。
    @tasks = Task.where('is_display=?', true).order(created_at: :desc).limit(5)
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      # 正常に登録ができた場合、タスク詳細画面に遷移し、タスクを登録しました。という登録完了メッセージを表示すること。
      redirect_to @task, notice: 'タスクを登録しました。'
    else
      # 正常に登録ができなかった場合、タスク登録画面のままで、バリデーションエラーのメッセージを表示すること。
      # エラーメッセージは_form.html.erbで表示
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @task.update(task_params)
      # 正常に編集ができた場合、タスク詳細画面に遷移し、タスクを更新しました。という編集完了メッセージを表示すること。
      redirect_to @task, notice: 'タスクを更新しました。'
    else
      # 正常に編集ができなかった場合、タスク編集画面のままで、バリデーションエラーのメッセージを表示すること。
      # エラーメッセージは_form.html.erbで表示
      render :edit
    end
    
  end

  # タスクの削除ができること。削除後、タスク一覧画面に遷移すること。
  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  def hide
    # Taskモデルのis_displayがfalseのデータを表示すること。
    @tasks = Task.where('is_display=?', false)
  end

  private
    # ストロングパラメータを定義
    def task_params
      params.require(:task).permit(:title, :memo, :is_display, :status)
    end
    # URIからidを使い、Articleモデルから1つ値を格納
    def set_task
      @task = Task.find(params[:id])
    end

end
