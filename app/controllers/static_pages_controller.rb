class StaticPagesController < ApplicationController
  before_filter :authenticate_user!, :except => [:about]
  def main
    @date_start = params[:start]
    @date_end   = params[:end]
    @collection = params[:collection]
    @text       = params[:search]

    date_start, date_end, text, collection = @date_start, @date_end, @text, @collection

    if @text.nil? or @text.strip.empty?
      @only_search = true
    else
      @query = Document.search do
        with(:collection, collection.downcase)
        with(:date, (date_start .. date_end))

        facet(:location)

        fulltext text

        order_by(:date, :asc)

        paginate :page => params[:page], :per_page => 15
      end

      @documents = @query.results
    end
  end

  def help
  end

  def about
  end
end
