class __Name__

  include MongoMapper::Document

  key :name, String, :default => 'hello'
  key :name, Boolean, :default => true

end
