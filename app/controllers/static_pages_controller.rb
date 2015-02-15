# Main search controller.
class StaticPagesController < ApplicationController
  before_action :authenticate_user!, except: [:about]

  def main
  end

  def search
    if params[:search].present? && params[:search][:q].present?
      @query = params[:search][:q]
      @search = search_for(@query)
      render 'main'
    else
      redirect_to root_path
    end
  end

  def help
  end

  def about
  end

  private

  def search_for(query)
    Document.search do
      # with(:collection, 'nl' || collection.downcase)
      # with(:date, (date_start..date_end))

      facet :location

      facet :collection

      fulltext query

      order_by(:date, :asc)

      paginate page: params[:page], per_page: 15
    end
  end
end
