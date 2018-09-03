class PagesController < ApplicationController
  def home
    @first_qoute_id = Quote.first.id
  end
end
