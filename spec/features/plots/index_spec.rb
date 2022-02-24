# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Plots Index Page' do
  before :each do
    @garden1 = Garden.create!(name: 'Flower Garden', organic: true)
    @garden2 = Garden.create!(name: "Henry's Farm", organic: false)
    @garden3 = Garden.create!(name: 'Bee Farm', organic: true)
    @plot1 = @garden1.plots.create!(number: 1, size: 'Large', direction: 'East')
    @plot2 = @garden1.plots.create!(number: 2, size: 'Large', direction: 'East')
    @plot3 = @garden2.plots.create!(number: 3, size: 'Large', direction: 'East')
    @plot4 = @garden2.plots.create!(number: 4, size: 'Large', direction: 'East')
    @plot5 = @garden3.plots.create!(number: 5, size: 'Large', direction: 'East')
    @plot6 = @garden3.plots.create!(number: 6, size: 'Large', direction: 'East')
    @plant1 = Plant.create!(name: 'Rose', description: 'flower', days_to_harvest: 5)
    @plant2 = Plant.create!(name: 'Bud', description: 'weed', days_to_harvest: 5)
    @plant3 = Plant.create!(name: 'Tomato', description: 'red', days_to_harvest: 5)
    @plant4 = Plant.create!(name: 'Pepper', description: 'green', days_to_harvest: 5)
    @plant5 = Plant.create!(name: 'Zuchini', description: 'yummy', days_to_harvest: 5)
    @plant6 = Plant.create!(name: 'Corn', description: 'sweet', days_to_harvest: 5)
    @pp1 = PlotPlant.create!(plot_id: @plot1.id, plant_id: @plant1.id)
    @pp2 = PlotPlant.create!(plot_id: @plot2.id, plant_id: @plant2.id)
    @pp3 = PlotPlant.create!(plot_id: @plot3.id, plant_id: @plant3.id)
    @pp4 = PlotPlant.create!(plot_id: @plot4.id, plant_id: @plant4.id)
    @pp5 = PlotPlant.create!(plot_id: @plot5.id, plant_id: @plant5.id)
    @pp6 = PlotPlant.create!(plot_id: @plot6.id, plant_id: @plant6.id)
  end

  describe 'user story 1' do
    it 'shows all plot information and plots plants on plot index page' do
      visit plots_path
      # save_and_open_page
      within("#plot-#{@plot1.id}") do
        expect(page).to have_content(@plot1.number)
        expect(page).to have_content(@plant1.name)
      end

      within("#plot-#{@plot2.id}") do
        expect(page).to have_content(@plot2.number)
        expect(page).to have_content(@plant2.name)
      end

      within("#plot-#{@plot3.id}") do
        expect(page).to have_content(@plot3.number)
        expect(page).to have_content(@plant3.name)
      end

      within("#plot-#{@plot4.id}") do
        expect(page).to have_content(@plot4.number)
        expect(page).to have_content(@plant4.name)
      end

      within("#plot-#{@plot5.id}") do
        expect(page).to have_content(@plot5.number)
        expect(page).to have_content(@plant5.name)
      end

      within("#plot-#{@plot6.id}") do
        expect(page).to have_content(@plot6.number)
        expect(page).to have_content(@plant6.name)
      end
    end
  end

  describe 'user story 2' do
    it 'removes a plant from a plot' do
      visit plots_path

      within("#plot-#{@plot1.id}") do
        within("#plotplant-#{@plot1.id}-#{@plant1.id}") do
          expect(page).to have_content(@plant1.name)
          expect(page).to have_link('Remove Plant from Plot')
          click_link 'Remove Plant from Plot'
        end
      end

      expect(current_path).to eq(plots_path)
      expect(page).to_not have_content(@plant1.name)

      within("#plot-#{@plot2.id}") do
        within("#plotplant-#{@plot2.id}-#{@plant2.id}") do
          expect(page).to have_content(@plant2.name)
          expect(page).to have_link('Remove Plant from Plot')
          click_link 'Remove Plant from Plot'
        end
      end

      expect(current_path).to eq(plots_path)
      expect(page).to_not have_content(@plant2.name)
    end
  end
end
