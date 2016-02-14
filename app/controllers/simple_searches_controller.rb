class SimpleSearchesController < ApplicationController
  before_action :set_simple_search, only: [:show, :edit, :update, :destroy]

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

  # GET /simple_searches/1
  # GET /simple_searches/1.json
  def show
  end

  # GET /simple_searches/new
  def new
    @simple_search = SimpleSearch.new
  end

  # GET /simple_searches/1/edit
  def edit
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

  # PATCH/PUT /simple_searches/1
  # PATCH/PUT /simple_searches/1.json
  def update
    respond_to do |format|
      if @simple_search.update(simple_search_params)
        format.html { redirect_to @simple_search, notice: 'Simple search was successfully updated.' }
        format.json { render :show, status: :ok, location: @simple_search }
      else
        format.html { render :edit }
        format.json { render json: @simple_search.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /simple_searches/1
  # DELETE /simple_searches/1.json
  def destroy
    @simple_search.destroy
    respond_to do |format|
      format.html { redirect_to simple_searches_url, notice: 'Simple search was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_simple_search
      @simple_search = SimpleSearch.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def simple_search_params
      params.require(:simple_search).permit(:keywords, :location)
    end
end
