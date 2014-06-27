class StaticPagesController < ApplicationController
  before_filter :authenticate_user!, :except => [:about]
  def main
    if params[:search].nil? or params[:search].strip.empty?
      @only_search = true
    else
      @query = Document.search do
        fulltext params[:search]
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
