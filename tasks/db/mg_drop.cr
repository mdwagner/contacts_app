class Db::MgDrop < LuckyTask::Task
  summary "Drop the database"
  name "mg.drop"

  def call
    path = Path.new(Dir.current, "db/contacts.db")
    File.delete(path) if File.exists?(path)
  end
end
