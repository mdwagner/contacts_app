class Contact
  DB.mapping({
    id: Int64,
    email: String,
    first: String?,
    last: String?,
    phone: String?,
    created_at: String?,
    updated_at: String?
  })
end
