class Problem
  include MongoMapper::Document

  # key <name>, <type>
  key :title, String
  key :description, String
  timestamps!
end
