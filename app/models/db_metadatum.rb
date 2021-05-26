class DbMetadatum < ApplicationRecord
  def self.dump_complete!(at)
    create!(dump_completed_at: at)
  end

  def self.can_restore?(will_restore_dump_completed_at)
    unless DbMetadatum.all.exists?
      DbMetadatum.create!(dump_completed_at: DUMP_COMPLETED_ON)
    end

    if DbMetadatum.last.dump_completed_at <= will_restore_dump_completed_at
      puts "ソースコードのDBをリストアしています"
      return
    else
      raise "DBを巻き戻しています"
    end
  end
end
