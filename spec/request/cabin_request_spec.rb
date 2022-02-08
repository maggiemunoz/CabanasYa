# frozen_string_literal: true

require 'rails_helper'

class CabinTest < ActiveSupport::TestCase
  RSpec.describe 'Cabins', type: :request do
    describe 'index' do
      it 'should return a successful request' do
        get '/cabins'
        expect(response).to have_http_status(:ok)
      end
    end

    describe 'index page' do
      it 'shows the right content' do
        visit root_path
        expect(page).to have_content('Cabañas Disponibles')
      end
    end

    describe 'create cabin' do
      it 'creates cabin correctly' do
        visit new_cabin_path
        fill_in 'Name', with: 'Cabaña Test'
        fill_in 'Description', with: 'Es una cabaña de prueba'
        fill_in 'Price', with: 10_000
        click_on 'Create Cabin'
        visit root_path
        expect(page).to have_content('Cabaña Test')
      end
    end
  end
end
