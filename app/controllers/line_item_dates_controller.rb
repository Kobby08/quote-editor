class LineItemDatesController < ApplicationController
  before_action :set_quote
  before_action :set_line_item_date, only: %i[edit update destroy]

  def new
    @line_item_date = @quote.line_item_dates.build
  end

  def create
    @line_item_date = @quote.line_item_dates.build(line_item_date_params)

    if @line_item_date.save
      respond_to do |format|
        format.html { redirect_to @quote, notice: 'Date created successfully!' }
        format.turbo_stream do
          flash.now[:notice] = 'Date created successfully!'
        end
      end
    else
      render :new, status: 422
    end
  end

  def edit; end

  def update
    if @line_item_date.update(line_item_date_params)
      respond_to do |format|
        format.html do
          redirect_to @quote, notice: 'Date was updated successfully!'
        end
        format.turbo_stream { flash.now[:notice] = 'Date upated successfully!' }
      end
    else
      render :edit, status: 422
    end
  end

  def destroy
    @line_item_date.destroy
    respond_to do |format|
      format.html do
        redirect_to quote_path(@quote), notice: 'Date was destroyed.'
      end
      format.turbo_stream { flash.now[:notice] = 'Date was destroyed.' }
    end
  end

  private

  def line_item_date_params
    params.required(:line_item_date).permit(:date)
  end

  def set_quote
    @quote = current_company.quotes.find(params[:quote_id])
  end

  def set_line_item_date
    @line_item_date = @quote.line_item_dates.find(params[:id])
  end
end
