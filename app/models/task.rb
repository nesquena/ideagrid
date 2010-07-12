class Task
  include MongoMapper::Document

  # key <name>, <type>
  key :title, String
  key :description, String
  key :frequency, String
  key :type, String
  key :people_needed, Integer
  timestamps!
end
