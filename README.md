### Controller

- static_pages
  - home
- users
  - new, create, show
  - questions
    - index
- sessions
  - new, create, destroy
- questions
  - index, new, create, show, update, destroy
- answers
  - create, update, destroy

### Model

- rails g model User name:string password_digest:string
- rails g model Question title:string content:text user:references
- rails g model Answer content:text best:boolean user:references question:references

### 疑問

- answers table に best column があるならば、questions table に resolved は要らない？とりあえずなしで実装してみる。
  - Question Model に attr_accessor :resolved と set_resolved method を追加。
  - questions#show では、controller 内で set_resolved で初期化し、view 内で@question.resolved で参照。
- answer update で best column の更新と content column の更新を同じコントロール内で処理していいのか？別々の flash message を表示したい。分岐する？
- N + 1 問題の解決策として includes method を使えばいいと rails guide に書いてあったが、理由がよくわからなかった。本アプリでは questions#show 内の @answers で使っている。
