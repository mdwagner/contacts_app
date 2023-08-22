# Load .env file before any other config or app code
require "lucky_env"
LuckyEnv.load?(".env")

# Require your shards here
require "lucky"
require "avram/lucky"
require "carbon"
require "authentic"
require "jwt"
require "jennifer"
require "jennifer_sqlite3_adapter"
