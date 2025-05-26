USER=root
PASSWORD=ThePassword01!?
# connectionstringで指定する場合、URLと同じようにエンコードが必要
PASSWORD_FORURL=ThePassword01%21%3F
AUTHDB=admin

URI="mongodb://${USER}:${PASSWORD_FORURL}@mongo01:27017"


# debug echo
echo "URI: '${URI}'"
