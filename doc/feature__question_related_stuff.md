## 変更点

### question

- rails g scaffold Question title:string content:text is_resolved:boolean user:references -> done
- 生成された db migration の変更と実行 -> done<br>
  user_id and created_at に対して index は追加しない
- static pages home を作る -> done<br>
  rails g controller StaticPages Home
