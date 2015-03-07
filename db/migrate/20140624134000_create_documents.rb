class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :docid
      t.text   :title
      t.text   :fulltext, limit: 4294967295
      t.date   :date
      t.string :location
      t.string :collection
      t.text :image_url

      t.timestamps
    end
  end
end
