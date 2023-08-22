class TimeUtcConverter
  def self.from_rs(rs : DB::ResultSet) : Time
    Time::Format::ISO_8601_DATE_TIME.parse(rs.read(String))
  end
end
