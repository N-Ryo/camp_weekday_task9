class Task < ApplicationRecord

  # Taskモデルのtitleは重複して登録されないこと。
  # Taskモデルのtitleが存在しない場合、登録できないこと。
  validates :title,  presence: true, uniqueness: true

  # Taskモデルのmemoが存在しない場合、登録できないこと。
  # Taskモデルのmemoは、10文字以上、30文字以内で登録できること。
  validates :memo,  presence: true, length: { maximum: 30, minimum: 10 }

  # Taskモデルのstatusが存在しない場合も保存できないようにする。
  validates :status, presence: true

  # Taskモデル内でenumを使用し、Taskモデルのstatusをソースコード上で意味の通る識別子として以下を参考に定義すること。
  # statusが0の場合draft
  # statusが1の場合published
  # statusが2の場合、archieved
  enum status: { draft: 0, published: 1, archieved: 2 }
end
