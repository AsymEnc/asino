# Model of the document.
class Document < ActiveRecord::Base
  searchable do
    text :fulltext
    date :date
    string :collection
    string :location
  end
end
