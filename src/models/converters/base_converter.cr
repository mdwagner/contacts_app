abstract class BaseConverter(T)
  abstract def self.from_rs(rs : DB::ResultSet) : T
end
