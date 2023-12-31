require "./shards"
require "./patches/no_manifest"

# Load the asset manifest
# Lucky::AssetHelpers.load_manifest "public/manifest.json"
Lucky::AssetHelpers.no_manifest

require "../config/server"
require "../config/**"
require "./app_database"
require "./models/mixins/**"
require "./models/converters/**"
require "./models/**"
require "./handlers/**"
require "./queries/mixins/**"
require "./queries/**"
require "./operations/mixins/**"
require "./operations/**"
require "./serializers/base_serializer"
require "./serializers/**"
require "./emails/base_email"
require "./emails/**"
require "./actions/mixins/**"
require "./actions/browser_action"
require "./actions/mobile_action"
require "./actions/**"
require "./components/base_component"
require "./components/base_hxml_component"
require "./components/**"
require "./pages/**"
require "./screens/**"
require "../db/migrations/**"
require "./app_server"
