require 'csv'
require 'date'

FILES_TO_PARSE = %w(nl_1.csv nl_2.csv nl_3.csv)

FILES_TO_PARSE.map! { |f| "#{Rails.root}/db/seeds/data/#{f}" }

params = {
  :col_sep => "\t",
  :row_sep => "\r\n",
  :quote_char => '"',
  :headers => true
}

threads = []
m = Mutex.new

FILES_TO_PARSE.each do |file|
  threads << Thread.new do
    CSV.foreach(file, params) do |row|
      m.synchronize do
        generated_date = Date.parse(row['paper_dc_date']).to_datetime.to_s
        Document.create!(
                         {
                           :docid => row['_id'],
                           :collection => row['paper_dc_language'],
                           :fulltext => row['text_content'],
                           :date => generated_date,
                           :title => row['article_dc_title'],
                           :location => row['paper_dcterms_spatial_creation'],
                           :image_url => row['article_dc_identifier_resolver']
                         }
                         )
      end
    end
  end
end

threads.each(&:join)
