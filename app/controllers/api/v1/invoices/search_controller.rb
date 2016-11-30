class Api::V1::Invoices::SearchController < ApplicationController

  def index
    render json: Invoice.where(invoice_params)
  end

  def show
    render json: Invoice.find_by(invoice_params)
  end

  def random
    offset = rand(Invoice.count)
    render json: Invoice.offset(offset).first
  end

  private

  def invoice_params
    params.permit(:id,
                  :status,
                  :customer_id,
                  :merchant_id,
                  :created_at,
                  :updated_at)
  end

end