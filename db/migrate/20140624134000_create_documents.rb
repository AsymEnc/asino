class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :docid
      t.string :title
      t.text   :fulltext
      t.date   :date
      t.string :location
      t.string :collection
      t.string :image_url

      t.timestamps
    end
  end
end
