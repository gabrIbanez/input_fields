class InputFieldOptionsController < ApplicationController
  before_action :set_input_field_option, only: %i[ show edit update destroy ]

  # GET /input_field_options or /input_field_options.json
  def index
    @input_field_options = InputFieldOption.all
  end

  # GET /input_field_options/1 or /input_field_options/1.json
  def show
  end

  # GET /input_field_options/new
  def new
    @input_field_option = InputFieldOption.new
  end

  # GET /input_field_options/1/edit
  def edit
  end

  # POST /input_field_options or /input_field_options.json
  def create
    @input_field_option = InputFieldOption.new(input_field_option_params)

    respond_to do |format|
      if @input_field_option.save
        format.html { redirect_to input_field_option_url(@input_field_option), notice: "Input field option was successfully created." }
        format.json { render :show, status: :created, location: @input_field_option }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @input_field_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /input_field_options/1 or /input_field_options/1.json
  def update
    respond_to do |format|
      if @input_field_option.update(input_field_option_params)
        format.html { redirect_to input_field_option_url(@input_field_option), notice: "Input field option was successfully updated." }
        format.json { render :show, status: :ok, location: @input_field_option }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @input_field_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /input_field_options/1 or /input_field_options/1.json
  def destroy
    @input_field_option.destroy

    respond_to do |format|
      format.html { redirect_to input_field_options_url, notice: "Input field option was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_input_field_option
      @input_field_option = InputFieldOption.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def input_field_option_params
      params.require(:input_field_option).permit(:name, :input_field_id, :position, :data)
    end
end
