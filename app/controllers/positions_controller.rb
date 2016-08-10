class PositionsController < ApplicationController
  before_action :set_position, only: [:show, :edit, :update, :destroy]
  before_action :prepare_positions, only: [:new, :edit, :create, :update]

  # GET /positions
  # GET /positions.json
  def index
    @positions = Position.all
  end

  # GET /positions/1
  # GET /positions/1.json
  def show
    @position = PositionService.new(@position).call

    render nothing: true if @position.blank?
  end

  # GET /positions/new
  def new
    @position = Position.new
  end

  # GET /positions/1/edit
  def edit
  end

  # POST /positions
  # POST /positions.json
  def create
    @position = Position.new(position_params)

    respond_to do |format|
      if @position.save
        format.html { redirect_to positions_url, notice: 'Position was successfully created.' }
        format.json { render :show, status: :created, location: @position }
      else
        format.html { render :new }
        format.json { render json: @position.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /positions/1
  # PATCH/PUT /positions/1.json
  def update
    respond_to do |format|
      if @position.update(position_params)
        format.html { redirect_to positions_url, notice: 'Position was successfully updated.' }
        format.json { render :show, status: :ok, location: @position }
      else
        format.html { render :edit }
        format.json { render json: @position.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /positions/1
  # DELETE /positions/1.json
  def destroy
    @position.destroy
    respond_to do |format|
      format.html { redirect_to positions_url, notice: 'Position was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_position
    @position = Position.find(params[:id])
  end

  def position_params
    if params.has_key?(:positions_vessel)
      model = :positions_vessel
    elsif params.has_key?(:positions_cargo)
      model = :positions_cargo
    else
      model = :position
    end

    params.require(model).permit(:title, :port_id, :date_open, :capacity, :type)
  end

  def prepare_positions
    @types = Position::TYPES.map { |type, human_name| [human_name, type] }
    @ports = Port.order(:title).map { |port| [port.title, port.id] }
  end
end
