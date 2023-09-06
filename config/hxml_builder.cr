Lucky::HXMLBuilder.configure do |settings|
  if LuckyEnv.development?
    settings.indent = 2
  end
end
