class LineItemsController < ApplicationController
  before_action :set_quote
  before_action :set_line_item_date
  before_action :set_line_item, only: %i[edit update destroy]

  def new
    @line_item = @line_item_date.line_items.build
  end

  def create
    @line_item = @line_item_date.line_items.build(line_item_params)
    if @line_item.save
      respond_to do |format|
        format.html { redirect_to @quote, notice: 'Item created successfully!' }
      end
    else
      render :new, status: 422
    end
  end

  def edit; end

  def update
    if @line_item.update(line_item_params)
      respond_to do |format|
        format.html { redirect_to @quote, notice: 'Item upated successfully!' }
      end
    else
      render :edit, status: 422
    end
  end

  def destroy
    @line_item.destroy
    respond_to do |format|
      format.html { redirect_to @quote, notice: 'Item was deleted!!' }
    end
  end

  private

  def set_quote
    @quote = current_company.quotes.find(params[:quote_id])
  end

  def set_line_item_date
    @line_item_date = @quote.line_item_dates.find(params[:line_item_date_id])
  end

  def set_line_item
    @line_item = @line_item_date.line_items.find(params[:id])
  end

  def line_item_params
    params
      .required(:line_item)
      .permit(:name, :description, :unit_price, :quantity)
  end
end
