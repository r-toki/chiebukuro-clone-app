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

- answers table に best column があるならば、questions table に resolved は要らない？
- questions/1 で render されるページに answer_new_form があっていいのか？仕方がない気がするが。
