## 開発中の疑問点

- model, db で課す制約は重複すべき？
- db 側であるカラムにユニーク制約を課したい。user-name をユニークにしたい。index を追加して unique: true にする？
- controller は単数形の名前でも良いのか？ session はモデルがなく DB にもレコードを持たないので単数形の方が良い気がした。
