class Db::Seed < LuckyTask::Task
  summary "Seed database"
  name "db.seed"

  def call
    CreateContact.run!(
      first: "John",
      last: "Doe",
      email: "john.doe@example.com",
      phone: "123-456-7890"
    )
    CreateContact.run!(
      first: "John",
      last: "Appleseed",
      email: "john.appleseed@example.com"
    )
  end
end
