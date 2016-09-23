class BookedroomsController < ApplicationController
  before_action :set_bookedroom, only: [:show, :edit, :update, :destroy]

  # GET /bookedrooms
  # GET /bookedrooms.json
  def index
    @bookedrooms = Bookedroom.all
  end

  def get_active_rooms
    @rooms=Bookedroom.where("user_id=?",session[:current_user_id])
  end

  # GET /bookedrooms/1
  # GET /bookedrooms/1.json
  def show
  end

  # GET /bookedrooms/new
  def new
    @bookedroom = Bookedroom.new
  end

  # GET /bookedrooms/1/edit
  def edit
  end

  # POST /bookedrooms
  # POST /bookedrooms.json
  def create
    @bookedroom = Bookedroom.new(bookedroom_params)

    respond_to do |format|
      if @bookedroom.save
        format.html { redirect_to @bookedroom, notice: 'Bookedroom was successfully created.' }
        format.json { render :show, status: :created, location: @bookedroom }
      else
        format.html { render :new }
        format.json { render json: @bookedroom.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bookedrooms/1
  # PATCH/PUT /bookedrooms/1.json
  def update
    respond_to do |format|
      if @bookedroom.update(bookedroom_params)
        format.html { redirect_to @bookedroom, notice: 'Bookedroom was successfully updated.' }
        format.json { render :show, status: :ok, location: @bookedroom }
      else
        format.html { render :edit }
        format.json { render json: @bookedroom.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookedrooms/1
  # DELETE /bookedrooms/1.json
  def destroy
    @bookedroom.destroy
    respond_to do |format|
      format.html { redirect_to bookedrooms_url, notice: 'Bookedroom was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bookedroom
      @bookedroom = Bookedroom.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bookedroom_params
      params.require(:bookedroom).permit(:roomno, :building, :size, :status)
    end
end
