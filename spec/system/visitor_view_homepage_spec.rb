require 'rails_helper'

describe 'Usuário visita tela inicial' do
  it 'e vê o nome da app' do
    # Arrange

    # Act
    visit('/')
    # Assert
    expect(page).to have_content('Incendiar')
  end
  it 'e vê os isqueiros/produtos cadastrados' do
    # Arrange
    Product.create!(
      name: 'Isqueiro Clássico Zippo',
      description: 'Isqueiro à prova de vento com garantia vitalícia. Modelo clássico da Zippo.',
      price: 150.00,
    )
    Product.create!(
      name: 'Isqueiro Jet Flame',
      description: 'Isqueiro com chama jet, ideal para acender charutos e uso em ambientes externos.',
      price: 80.00,
    )
    # Act
    visit root_path
    # Assert
    expect(page).to have_content('Isqueiro Clássico Zippo')
    expect(page).to have_content('R$ 150.00')

    expect(page).to have_content('Isqueiro Jet Flame')
    expect(page).to have_content('R$ 80.00')

    expect(page).to have_button('Add to Cart')
    expect(page).not_to have_content('Nenhum produto cadastrado')
  end
  it 'e não existem isqueiros/produtos cadastrados' do
    # Arrange

    # Act
    visit root_path
    # Assert
    expect(page).to have_content('Nenhum produto cadastrado')
  end
end
