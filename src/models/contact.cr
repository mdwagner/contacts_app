class Contact < Jennifer::Model::Base
  with_timestamps

  mapping(
    id: Primary64,
    email: String,
    first: String?,
    last: String?,
    phone: String?,
    created_at: Time?,
    updated_at: Time?,
  )
end
