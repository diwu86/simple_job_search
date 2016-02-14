class SimpleSearchesController < ApplicationController

  # GET /simple_searches
  # GET /simple_searches.json
  def index
    @simple_search =  SimpleSearch.new(keywords: params[:keywords], location: params[:location])
    get_response(params)
    respond_to do |format|
      format.html { render :index}
      format.json { render :index, status: 200 }
    end
  end

  # GET /simple_searches/new
  def new
    @simple_search = SimpleSearch.new
  end

  # POST /simple_searches
  # POST /simple_searches.json
  def create
    @simple_search = SimpleSearch.new(simple_search_params)
    get_response(params)
    respond_to do |format|
      format.html { render :index}
      format.json { render :index, status: 200 }
    end
  end

  private

  def get_response(params)
    @simple_search.set_up_client
    @current_page = params[:page].nil? ? 1 : params[:page].to_i
    response = @simple_search.get_search_result(@current_page)
    result = JSON.parse(response.body)
    @search_results = result['ResponseJobSearch']
    @total_page = @search_results['TotalPages'].first.to_i if @search_results
    unless @search_results
      @notice = result['message']
      Rails.logger.error result['message']
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def simple_search_params
    params.require(:simple_search).permit(:keywords, :location)
  end
end
