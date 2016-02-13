class SimpleSearchesController < ApplicationController
  before_action :set_simple_search, only: [:show, :edit, :update, :destroy]

  # GET /simple_searches
  # GET /simple_searches.json
  def index
    @simple_searches = SimpleSearch.all
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
    @simple_search.set_up_client
    response = @simple_search.get_search_result
    # respond_to do |format|
    #   if @simple_search.save
    #     format.html { redirect_to @simple_search, notice: 'Simple search was successfully created.' }
    #     format.json { render :show, status: :created, location: @simple_search }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @simple_search.errors, status: :unprocessable_entity }
    #   end
    # end
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
