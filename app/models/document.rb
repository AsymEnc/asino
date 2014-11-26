class Document < ActiveRecord::Base
  searchable do
    text :fulltext
    date :date
    string :collection
  end
end
