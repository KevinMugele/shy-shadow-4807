# frozen_string_literal: true

class PlotsController < ApplicationController
  def index
    @plots = Plot.all
  end
end
