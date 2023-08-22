require "jennifer"
require "jennifer_sqlite3_adapter"

Jennifer::Config.configure do |conf|
  conf.adapter = "sqlite3"
  conf.host = "./db"
  conf.db = "contacts.db"
  conf.logger = Log.for("db", :none)
end

# Log.setup "db", :debug, Log::IOBackend.new(formatter: Jennifer::Adapter::DBFormatter)
