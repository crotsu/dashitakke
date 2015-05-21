class SourcesController < ApplicationController
  before_action :set_source, only: [:show, :edit, :update, :destroy]

  # GET /sources
  # GET /sources.json
  def index
    @sources = Source.all
  end

  # GET /sources/1
  # GET /sources/1.json
  def show
    @answer = Answer.find(@source.answer.id)
    f = open(@source.avatar.path, "r")
    @cfile = f.read
    f.close
  end

  # GET /sources/new
  def new
    @source = Source.new
  end

  # GET /sources/1/edit
  def edit
  end

  # POST /sources
  # POST /sources.json
  def create
    @source = Source.new(source_params)

    @source.filename = params[:original_filename]
    @source.content_type = "texttext"
    @source.filesize = 520000
    @source.code = "oh"
    @source.answer_id = params[:answer_id]

    respond_to do |format|
      if @source.save

        @answer = Answer.find(@source.answer_id)
        @answer.update(status: "UPLOAD")

        format.html { redirect_to @source, notice: 'Source was successfully created.' }
        format.json { render :show, status: :created, location: @source }
      else
        format.html { render :new }
        format.json { render json: @source.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sources/1
  # PATCH/PUT /sources/1.json
  def update
    f = source_params[:code]
    source = {}
    if f != nil
      source[:filename] = f.original_filename
      source[:content_type] = f.content_type
      source[:filesize] = f.size
      source[:code] = f.read
    end

    respond_to do |format|
      if @source.update(source)
        format.html { redirect_to @source, notice: 'Source was successfully updated.' }
        format.json { render :show, status: :ok, location: @source }
      else
        format.html { render :edit }
        format.json { render json: @source.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sources/1
  # DELETE /sources/1.json
  def destroy
    @source.destroy
    respond_to do |format|
      format.html { redirect_to sources_url, notice: 'Source was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_source
      @source = Source.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def source_params
      params.require(:source).permit(:filename, :content_type, :filesize, :code, :answer_id, :avatar)
    end
end
