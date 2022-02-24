# frozen_string_literal: true

class PlotPlant < ApplicationRecord
  belongs_to :plot
  belongs_to :plant
end
