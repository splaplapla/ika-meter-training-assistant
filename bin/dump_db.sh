# dumpに関してはそのまま上書きする. ブロックするタイミングはない
mysqldump -uroot training_assistant_development > db/dump.sql
DUMP_COMPLETED_ON=$(grep "Dump completed on" db/dump.sql | grep "202.*$" -o)
echo "DUMP_COMPLETED_ON = '$DUMP_COMPLETED_ON'"> config/initializers/metadata.rb
bundle exec rails r "DbMetadatum.dump_complete!('\${$DUMP_COMPLETED_ON}')"
