class ShiftsController < ApplicationController
  before_action :set_shift, only: %i[ show edit update destroy ]

  
  def index
    @shifts = Shift.all
  end

  
  def show
  end

  
  def new
    @shift = Shift.new
  end

  
  def edit
  end

  
  def create
    #if date was current date @start = Time.parse(params[:start]) @finish = Time.parse(params[:finish])
    @start = params[:shift_date].to_s + ' ' + Time.strptime(params[:start], '%I:%M %P').strftime("%H:%M").to_s
    @finish = params[:shift_date].to_s + ' ' + Time.strptime(params[:finish], '%I:%M %P').strftime("%H:%M").to_s
    @shift = Shift.new(user_id:current_user.id, start:@start, finish:@finish, break_length:params[:break_length])

    respond_to do |format|
      if @shift.save
        format.html { redirect_to shifts_path}
        format.json { render :show, status: :created, location: @shift }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @shift.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def update
    respond_to do |format|
      if @shift.update(shift_params)
        format.html { redirect_to shift_url(@shift), notice: "Shift was successfully updated." }
        format.json { render :show, status: :ok, location: @shift }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @shift.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def destroy
    @shift.destroy

    respond_to do |format|
      format.html { redirect_to shifts_url, notice: "Shift was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    
    def set_shift
      @shift = Shift.find(params[:id])
    end

    
    def shift_params
      params.require(:shift).permit(:user_id, :start, :finish, :break_length)
    end
end
