class ChangeFulltextLength < ActiveRecord::Migration
  def change
    change_column :documents, :fulltext, :text, :limit => 4294967295
  end
end
