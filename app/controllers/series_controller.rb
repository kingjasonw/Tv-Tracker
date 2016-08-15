class SeriesController < ApplicationController
  before_action :set_series, only: [:show, :edit, :update, :destroy]
  respond_to :json, :html

  def track
    @series = Series.find(params[:id])
    @series.users << current_user
    respond_to do |format|
        format.html { redirect_to series_url }
    end
    rescue => e 
      flash[:notice] = "You're already tracking that series!"
      redirect_to(:action => 'show')
  end

  def untrack
    @series = Series.find(params[:id])
    current_user.lists.find_by_series_id(@series.id).destroy if current_user
    respond_to do |format|
      format.html { redirect_to series_index_url}
    end
    rescue => e 
      flash[:notice] = "You aren't tracking that series!"
      redirect_to(:action => 'show')
  end

  # GET /series
  # GET /series.json
  def index
    if params[:q]
      search_term = params[:q]
      if Rails.env.development?
        @series = Series.where("title LIKE ?", "%#{search_term}%")
      else
        @series = Series.where("title ilike ?", "%#{search_term}%")
      end
    else
      @series = Series.all.paginate(:page => params[:page], :per_page => 50)
    end
    
  end

  def autocomplete
    @series = Series.order(:title).where("title LIKE ?", "%#{params[:term]}%")
    respond_to do |format|
      format.html
      format.json { 
        render json: @series.map(&:title).to_json
      }
  end
end

  # GET /series/1
  # GET /series/1.json
  def show
     @series = Series.find_by_id(params[:id])
     if current_user && user_signed_in? 
      @list = List.where(user_id: current_user.id, series_id: @series.id)
    else
    end
  end

  

  # GET /series/new
  def new
    @series = Series.new
  end

  # GET /series/1/edit
  def edit
    @series = Series.find_by_id(params[:id])
  end

  # POST /series
  # POST /series.json
  def create
    @series = Series.new(series_params)
    respond_to do |format|
      if @series.save
        format.html { redirect_to series_index_url, notice: 'Series was successfully created.' }
        format.json { render :show, status: :created, location: @series }
      else
        format.html { render :new }
        format.json { render json: @series.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /series/1
  # PATCH/PUT /series/1.json
  def update
    @series = Series.find_by_id(params[:id])
    respond_to do |format|
      if @series.update(series_params)
        format.html { redirect_to @series, notice: 'Series was successfully updated.' }
        format.json { render :show, status: :ok, location: @series }
      else
        format.html { render :edit }
        format.json { render json: @series.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /series/1
  # DELETE /series/1.json
  def destroy
    @series.destroy
    respond_to do |format|
      format.html { redirect_to series_index_url, notice: 'Series was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_series
      @series = Series.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def series_params
      params.require(:series).permit(:title, :description, :network, :premiere, :cast, :creator, :genre_id, :poster, :url)
    end
end
