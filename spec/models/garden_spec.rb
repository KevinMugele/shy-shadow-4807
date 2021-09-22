require 'rails_helper'

RSpec.describe Garden do
  describe 'relationships' do
    it { should have_many(:plots) }
  end

  it '#plants_by_harvest_time' do
    @garden1 = Garden.create!(name: "Flower Garden", organic: true)
    @garden2 = Garden.create!(name: "Henry's Farm", organic: false)
    @garden3 = Garden.create!(name: "Bee Farm", organic: true)
    @plot1 = @garden1.plots.create!(number: 1, size: "Large", direction: "East")
    @plot2 = @garden1.plots.create!(number: 2, size: "Large", direction: "East")
    @plot3 = @garden2.plots.create!(number: 3, size: "Large", direction: "East")
    @plot4 = @garden2.plots.create!(number: 4, size: "Large", direction: "East")
    @plot5 = @garden3.plots.create!(number: 5, size: "Large", direction: "East")
    @plot6 = @garden3.plots.create!(number: 6, size: "Large", direction: "East")
    @plot7 = @garden1.plots.create!(number: 6, size: "Large", direction: "East")
    @plant1 = Plant.create!(name: "Rose", description: 'flower', days_to_harvest: 5)
    @plant2 = Plant.create!(name: "Bud", description: 'weed', days_to_harvest: 5000)
    @plant3 = Plant.create!(name: "Tomato", description: 'red', days_to_harvest: 5)
    @plant4 = Plant.create!(name: "Pepper", description: 'green', days_to_harvest: 5)
    @plant5 = Plant.create!(name: "Zuchini", description: 'yummy', days_to_harvest: 5)
    @plant6 = Plant.create!(name: "Corn", description: 'sweet', days_to_harvest: 5)
    @plant7 = Plant.create!(name: "Carrot", description: 'cool', days_to_harvest: 50)
    @pp1 = PlotPlant.create!(plot_id: @plot1.id, plant_id: @plant1.id)
    @pp2 = PlotPlant.create!(plot_id: @plot2.id, plant_id: @plant2.id)
    @pp3 = PlotPlant.create!(plot_id: @plot3.id, plant_id: @plant3.id)
    @pp4 = PlotPlant.create!(plot_id: @plot4.id, plant_id: @plant4.id)
    @pp5 = PlotPlant.create!(plot_id: @plot5.id, plant_id: @plant5.id)
    @pp6 = PlotPlant.create!(plot_id: @plot6.id, plant_id: @plant6.id)
    @pp7 = PlotPlant.create!(plot_id: @plot1.id, plant_id: @plant7.id)

    actual = @garden1.plants_by_harvest_time(100).map do |plant|
      plant.id
    end

    expected = [@plant1.id, @plant7.id]

    expect(actual).to eq(expected)
  end
end
