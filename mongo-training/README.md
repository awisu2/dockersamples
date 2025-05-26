# mongo training

1. run: `./bin/compose.sh up`
2. access: `./bin/access_db.sh up`

## add user/password

```bash
use admin

db.createUser({
  user: "root",
  pwd: "ThePassword01!?",
  roles: [ { role: "root", db: "admin" } ]
})

db.getUsers()
```

1. 一度、mongoを停止して、認証モードで起動 `./bin/compose.sh up2`
  - こちらを最初に起動した場合は、ユーザも自動作成される
2. アクセス: `./bin/access_db.sh root`
    - ConnectionStringで: `./bin/access_db.sh rootstring`

