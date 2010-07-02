MongoMapper.connection = Mongo::Connection.new('localhost', nil, :logger => logger)

case Padrino.env
  when :development then MongoMapper.database = 'ideagrid_development'
  when :production  then MongoMapper.database = 'ideagrid_production'
  when :test        then MongoMapper.database = 'ideagrid_test'
end
