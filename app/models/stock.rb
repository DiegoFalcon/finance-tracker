class Stock < ApplicationRecord

  def self.strip_commas(number)
    number.gsub(",","")
  end

  def self.new_form_lookup(ticker_symbol)
    begin
      looked_up_stock = StockQuote::Stock.quote(ticker_symbol)
      new(name: looked_up_stock.name, ticker: looked_up_stock.symbol, last_price: strip_commas(looked_up_stock.l))
    rescue Exception => e
      return nil
    end
  end


end
