class InputFieldsController < ApplicationController
  before_action :set_input_field, only: %i[ show edit update destroy ]
  before_action :ensure_form

  # GET /input_fields or /input_fields.json
  def index
    @input_fields = InputField::Base.where(form_id: params[:form_id])
  end

  # GET /input_fields/1 or /input_fields/1.json
  def show
  end

  # GET /input_fields/new
  def new
    @input_field = InputField::Base.new
  end

  # GET /input_fields/1/edit
  def edit
  end

  # POST /input_fields or /input_fields.json
  def create
    @input_field = InputField::Base.new(input_field_params.merge(form_id: @my_form.id))

    respond_to do |format|
      if @input_field.save
        format.html { redirect_to form_path(@my_form), notice: "Input field was successfully created." }
        format.json { render :show, status: :created, location: @input_field }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @input_field.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /input_fields/1 or /input_fields/1.json
  def update
    respond_to do |format|
      if @input_field.update(input_field_params)
        format.html { redirect_to input_field_url(@input_field), notice: "Input field was successfully updated." }
        format.json { render :show, status: :ok, location: @input_field }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @input_field.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /input_fields/1 or /input_fields/1.json
  def destroy
    @input_field.destroy

    respond_to do |format|
      format.html { redirect_to input_fields_url, notice: "Input field was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def ensure_form
    @my_form = Form.find(params[:form_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_input_field
    @input_field = InputField::Base.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def input_field_params
    params.require(:input_field_base).permit(:hint, :label, :position, :type)
  end
end
