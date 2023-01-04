class FormPagesController < ApplicationController
  
  before_action :my_form, only: :show

  def create
    @answer = CreateAnswer.new.call(form_id: my_form.id, answers: answer_params.to_unsafe_h)

    respond_to do |format|
      if @answer.save
        format.html { redirect_to root_path, notice: "Answer was successfully created." }
        format.json { render :show, status: :created, location: @answer }
      else
        format.html { render :show, status: :unprocessable_entity }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  private

  def answer_params
    params.require(:answer).permit(inputs_list)
  end

  def inputs_list
    my_form
      .input_fields
      .map(&:slug)
  end

  def my_form
    @my_form ||= Form.includes(input_fields: :options).find(params[:id])
  end
end
