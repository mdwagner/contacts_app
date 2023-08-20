require "carbon_send_in_blue_adapter"

BaseEmail.configure do |settings|
  if LuckyEnv.production?
    # If you don't need to send emails, set the adapter to DevAdapter instead:
    #
    #   settings.adapter = Carbon::DevAdapter.new
    #
    # If you do need emails, get a key from SendInBlue and set an ENV variable
    sendinblue_key = sendinblue_key_from_env
    settings.adapter = Carbon::SendInBlueAdapter.new(api_key: sendinblue_key)
  elsif LuckyEnv.development?
    settings.adapter = Carbon::DevAdapter.new(print_emails: true)
  else
    settings.adapter = Carbon::DevAdapter.new
  end
end

private def sendinblue_key_from_env
  ENV["SENDINBLUE_API_KEY"]? || raise_missing_key_message
end

private def raise_missing_key_message
  puts "Missing SENDINBLUE_API_KEY. Set the SENDINBLUE_API_KEY env variable to '' if not sending emails, or set the SENDINBLUE_API_KEY ENV var.".colorize.red
  exit(1)
end
