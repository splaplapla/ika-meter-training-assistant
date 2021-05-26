# DBの先祖返りを防ぐために、sync_atよりも新しいときにエラーにする

DUMP_COMPLETED_ON=$(grep "Dump completed on" db/dump.sql | grep "202.*$" -o)
bundle exec rails r "DbMetadatum.can_restore?('\${$DUMP_COMPLETED_ON}')"
cat db/dump.sql | mysql -uroot training_assistant_development
