class RoomsController < InheritedResources::Base



  private

    def room_params
      params.require(:room).permit(:size, :building, :room_num)
    end

end

