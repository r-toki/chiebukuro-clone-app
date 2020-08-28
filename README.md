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

- questions#index にて resolved_questions, unresolved_questions を取得する方法は適切か？
- breadcrumbs を導入した。home > questions > question となるとき、parent の指定をクエリ付きで行いたい。questions_path は params[:resolved] の真偽に応じて、resolved_questions と unresolved_questions に分岐させたい。
