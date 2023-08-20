module Lucky::AssetHelpers
  macro no_manifest
    {% CONFIG[:has_loaded_manifest] = true %}
  end
end
