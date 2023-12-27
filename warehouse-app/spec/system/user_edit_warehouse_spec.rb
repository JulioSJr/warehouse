require 'rails_helper'

describe 'Usuário edita um galpão' do
  it 'a partir da página de detalhes' do
    # Arrange
    warehouse = Warehouse.create!(name: 'Aeroporto SP', code: 'GRU', city: 'Guarulhos', area: 100_000,
                                 adress: 'Avenida do Aeroporto, 100', cep: '15000-000', 
                                 description: 'Galpão destinado para cargas internacionais')

    # Act
    visit root_path
    click_on 'Aeroporto SP'
    click_on 'Editar'

    # Assert
    expect(page).to have_content 'Editar Galpão'
    expect(page).to have_field('Nome')
    expect(page).to have_field('Descrição')
    expect(page).to have_field('Código')
    expect(page).to have_field('Endereço')
    expect(page).to have_field('Cidade')
    expect(page).to have_field('CEP')
    expect(page).to have_field('Área')
    
  end
  
  it 'com sucesso' do
    # Arrange
    warehouse = Warehouse.create!(name: 'Aeroporto SP', code: 'GRU', city: 'Guarulhos', area: 100_000,
      adress: 'Avenida do Aeroporto, 100', cep: '15000-000', 
      description: 'Galpão destinado para cargas internacionais')

    # Act
    visit root_path
    click_on 'Aeroporto SP'
    click_on 'Editar'
    fill_in 'Nome', with: 'Galpão Internacional'
    fill_in 'Área', with: '200000'
    fill_in 'Endereço', with: 'Avenida dos Galpões, 500'
    fill_in 'CEP', with: '16000-000'
    click_on 'Enviar'

    # Assert
    expect(page).to have_content 'Galpão atualizado com sucesso'
    expect(page).to have_content 'Nome: Galpão Internacional'
    expect(page).to have_content 'Endereço: Avenida dos Galpões, 500'
    expect(page).to have_content 'Área: 200000m²'
    expect(page).to have_content 'CEP: 16000-000'
  end

  it 'e mantém os campos obrigatorios' do
    # Arrange
    warehouse = Warehouse.create!(name: 'Aeroporto SP', code: 'GRU', city: 'Guarulhos', area: 100_000,
      adress: 'Avenida do Aeroporto, 100', cep: '15000-000', 
      description: 'Galpão destinado para cargas internacionais')

    # Act
    visit root_path
    click_on 'Aeroporto SP'
    click_on 'Editar'
    fill_in 'Nome', with: ''
    fill_in 'Área', with: ''
    fill_in 'Endereço', with: ''
    fill_in 'CEP', with: ''
    click_on 'Enviar'

    # Assert
    expect(page).to have_content 'Não foi possível atualizar o galpão'
  end
end