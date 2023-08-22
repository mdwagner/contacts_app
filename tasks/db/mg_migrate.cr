class Db::MgMigrate < LuckyTask::Task
  summary "MG migrate"
  name "mg.migrate"

  def call
    AppDatabase.open do |db|
      MG::Migration.new(db).migrate
    end
  end
end
