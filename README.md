# mvp-third の機能仕様とその見積もり

- ユーザー登録<br>
  1h -> 45m
- ログイン/ログアウト<br>
  3h
- 質問投稿<br>
  2h
- 質問一覧画面（解決済み/未解決に分ける & ページング付き）<br>
  1h
- ホーム画面（投稿フォーム/解決済み 5 件/未解決 5 件）<br>
  2h
- 質問詳細画面<br>
  2h
- 質問投稿者が質問を解決済みにする<br>
  1h
- 回答投稿<br>
  2h
- ユーザー詳細画面（投稿した質問一覧/回答した質問一覧を閲覧できる）<br>
  2h

# phase2 の機能仕様とその見積もり

- 解決済みにする際にベストアンサーを選ぶ -> ベストアンサーを選ぶことにより解決済みにできる<br>
  1h
- 質問詳細画面でベストアンサーがあればトップに表示される<br>
  1h
- 未解決質問に対する回答は削除可能<br>
  1h
- 回答が一件も付いていない場合は質問を削除可能<br>
  1h

# controller 一覧

- static_pages<br>
  home
- users<br>
  new, create, show
- questions<br>
  index, new, create, show, edit, update, destroy
- session<br>
  new, create, destroy

# model 一覧

- User<br>
  name:string password_digest:string
- Question<br>
  title:string content:text best_answer_id:integer user:references
- Answer<br>
  content:text user:references question:references
