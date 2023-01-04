class FormsController < ApplicationController
  before_action :set_form, only: %i[ show edit update destroy ]

  # GET /forms or /forms.json
  def index
    @my_forms = Form.all
  end

  # GET /forms/1 or /forms/1.json
  def show
  end

  # GET /forms/new
  def new
    @my_form = Form.new
  end

  # GET /forms/1/edit
  def edit
  end

  # POST /forms or /forms.json
  def create
    @my_form = Form.new(form_params.merge(user_id: current_user.id))

    respond_to do |format|
      if @my_form.save
        format.html { redirect_to form_url(@my_form), notice: "Form was successfully created." }
        format.json { render :show, status: :created, location: @my_form }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @my_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /forms/1 or /forms/1.json
  def update
    respond_to do |format|
      if @my_form.update(form_params)
        format.html { redirect_to form_url(@my_form), notice: "Form was successfully updated." }
        format.json { render :show, status: :ok, location: @my_form }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @my_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /forms/1 or /forms/1.json
  def destroy
    @my_form.destroy

    respond_to do |format|
      format.html { redirect_to forms_url, notice: "Form was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_form
      @my_form = Form.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def form_params
      params.require(:form).permit(:user_id, :title, :active)
    end
end
