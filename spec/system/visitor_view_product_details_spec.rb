require 'rails_helper'

describe 'Usuário vê detalhes de um produto' do
  before do
    Product.create!(
      name: 'Isqueiro Jet Flame',
      price: 80.00,
      description: 'Isqueiro com chama jet, ideal para acender charutos e uso em ambientes externos.',
      stock: 50,
    )
  end
  it 'e vê descrição' do
    # Arrange

    # Act
    visit root_path
    click_on 'Isqueiro Jet Flame'

    # Assert
    expect(page).to have_content('Isqueiro Jet Flame')
    expect(page).to have_content('R$ 80.00')
    expect(page).to have_content('Isqueiro com chama jet, ideal para acender charutos e uso em ambientes externos.')
    expect(page).to have_content('50')
    expect(page).to have_content('unidades disponíveis')

    expect(page).to have_button('Add to Cart')
    expect(page).to have_link('Check Out')
  end
  it 'e volta pra tela inicial' do
    # Arrange

    # Act
    visit root_path
    click_on 'Isqueiro Jet Flame'
    click_on 'Voltar'

    # Assert
    expect(current_path).to eq(root_path)
  end
end
