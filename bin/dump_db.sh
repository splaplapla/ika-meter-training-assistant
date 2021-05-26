# ブロック機能はなくてそのまま上書きする
DUMP_COMPLETED_ON=grep "Dump completed on" db/dump.sql | grep "202.*$" -o

# sync_atのハードコードを更新する
