module ApplicationHelper
  # indexのビューにおいて style="color: ;"の半角スペース部分に値を返すメソッドを定義
  # 引数は@tasks.eachで回す際のインスタンスオブジェクト task 

  # Taskモデルのstatusが0の場合、色を#FF0000にして表示すること。
  # Taskモデルのstatusが1の場合、色を#0000FFにして表示すること。
  # Taskモデルのstatusが2の場合、色を#008000にして表示すること。

  def status_color(task)
    # taskで呼び出しているメソッドはそれぞれ、enumで定義することで使用することができる判定用メソッド
    # returnを明示することで、ifがtrueになった以下の処理を省略することができる
    return "#FF0000" if task.draft?
    return "#0000FF" if task.published?
    return "#008000" if task.archieved?
  end
end
