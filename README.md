mvp は手探り状態で闇雲に作ったためかなり汚い。一旦落ち着いて作り直す。

## コードの生成に使う rails コマンド

基本的には scaffold ベースで行う。不要なファイル／コードは削除する要領で開発してみる。

```
rails g scaffold User name:string password_digest:string
rails g scaffold Question title:string content:text is_resolved:boolean user:references
rails g scaffold Answer content:text user:references question:references
rails g controller Sessions new create destroy
```

## 改善点

- login / signup に誘導するコントローラーを整理する。login / signup 後にリダイレクトする機能を実装する。（rails tutorial とは違う実装で）
- update / create コントローラーの時は、\_params を使うようにする。question.is_resolved を有効にする時にチェックしてない。<br>
  button クリックのトリガーで update のアクションへ。form_with の submit button だけ使って、is_resolved は hidden tag に入れる？
- view のコンポーネント化を意識して綺麗に作る。css クラスの名前の付け方に統一感を持たせる。
- テストコードを書くべき。
- before_action を全く書いてない。とりあえず認可が必要なアクションに対して行う。
- 本番環境で ssl を使う

## 疑問点

- model で行う validation は DB で課せられる制約を含むべきか？
- model, controller, helper の住み分けは？
- 変数のスコープと寿命は？ 例えば rails tutorial の @current_user が謎。
- redirect する時の params の引き継ぎ方は？ login / signup を行き来する時に redirect_back_path のような params を引き継ぎたい。
- model と db のテーブルは1対1に対応させるのか？各テーブルを結合することによって意味を持つ？大きなプロジェクトならば user が持つ情報は複数のテーブルに散らばるはず。

## よく確認したくなるもの

### controller の順番

ex.) resources :photos

| VERB      | PATH             | Controller#Actions |
| --------- | ---------------- | ------------------ |
| GET       | /photos          | photos#index       |
| GET       | /photos/new      | photos#new         |
| POST      | /photos          | photos#create      |
| GET       | /photos/:id      | photos#show        |
| GET       | /photos/:id/edit | photos#edit        |
| PATCH/PUT | /photos/:id      | photos#update      |
| DELETE    | /photos/:id      | photos#destroy     |
