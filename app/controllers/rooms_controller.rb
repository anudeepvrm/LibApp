class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :edit, :update, :destroy]


  def search_rooms
    @room=Room.new
  end

  # GET /rooms
  # GET /rooms.json
  def index
    @rooms = Room.all
  end

  def get_room_list
  end

  def book_room

    booked_room=Bookedroom.new(:user_id=>session[:current_user_id],:room_id=>params[:id],:status=>'booked',:booking_time=>params[:date].to_datetime.in_time_zone('UTC'))
    respond_to do |format|
      if booked_room.save
        format.html { redirect_to user_home_path, notice: 'Room was successfully booked. NOTE: You can have only one active booking' }
        format.json { render :show, status: :created, location: @room }
      else
        format.html { render user_home_path, notice: 'Sorry. Try Again' }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end

  end



  def get_search_rooms
    @room=Room.new(room_params)
    @id=session[:current_user_id]
    date=Time.new(@room.date[1].to_i, @room.date[2].to_i,
                             @room.date[3].to_i, @room.date[4].to_i,
                             @room.date[5].to_i)
    @date=date
    @room.date=date
    if date.past?
      redirect_to search_rooms_path, notice: 'Please book future time slot. eg: if time is 1:13, you can\'t book 1:00 slot'

    elsif date>Time.now+24*3600*7
      redirect_to search_rooms_path, notice: 'Only can book one week in advance'

    else
      conditions = []
      conditions << "roomno = #{@room.roomno}" if @room.roomno !=nil
      conditions << "building = '#{@room.building}'"
      conditions << "size = '#{@room.size}'"

      @rooms = Room.where(conditions.join(" AND "))
      @rooms.each do |room|
        room.date=date
        list_of_booked_rooms=Bookedroom.where("room_id=?",room.roomno)
        if list_of_booked_rooms.blank?
          room.status='available'
        else
          if  list_of_booked_rooms.where("booking_time > ? and booking_time < ? ",date-2*(3600),date+2*3600).blank?
          room.status='available'
          else
            room.status='booked'
          end
        end

      end
      if @room.status != 'any'
      @rooms=@rooms.select do |room|
        room.status == @room.status
      end
      end
    end
    end


  # GET /rooms/1
  # GET /rooms/1.json
  def show
  end

  # GET /rooms/new
  def new
    @room = Room.new
  end

  # GET /rooms/1/edit
  def edit
  end

  # POST /rooms
  # POST /rooms.json
  def create
    @room = Room.new(room_params)

    respond_to do |format|
      if @room.save
        format.html { redirect_to @room, notice: 'Room was successfully created.' }
        format.json { render :show, status: :created, location: @room }
      else
        format.html { render :new }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rooms/1
  # PATCH/PUT /rooms/1.json
  def update
    respond_to do |format|
      if @room.update(room_params)
        format.html { redirect_to @room, notice: 'Room was successfully updated.' }
        format.json { render :show, status: :ok, location: @room }
      else
        format.html { render :edit }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rooms/1
  # DELETE /rooms/1.json
  def destroy
    @room.destroy
    respond_to do |format|
      format.html { redirect_to rooms_url, notice: 'Room was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def room_params
      params.require(:room).permit(:roomno, :building, :size, :status,:date)
    end
end
