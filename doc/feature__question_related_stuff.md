## 変更点

### question

- rails g scaffold Question title:string content:text is_resolved:boolean user:references -> done
- 生成された db migration の変更と実行 -> done
  - user_id and created_at に対して index は追加しない
- static pages home を作る<br>
  rails g controller StaticPages Home
