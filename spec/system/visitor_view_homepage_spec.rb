require "rails_helper"

describe "Usuário visita tela inicial" do
  it "e vê o nome da app" do
    # Arrange

    # Act
    visit("/")
    # Assert
    expect(page).to have_content("Incendiar")
    expect(page).to have_link("Incendiar", href: root_path)
    expect(page).not_to have_link("Cadastrar Produto")
  end
  it "e vê os isqueiros/produtos cadastrados" do
    # Arrange
    Product.create!(
      name: "Isqueiro Clássico Zippo",
      description: "Isqueiro à prova de vento com garantia vitalícia. Modelo clássico da Zippo.",
      price: 150.00,
      stock: 30,
    )
    p = Product.create!(
      name: "Isqueiro Jet Flame",
      description: "Isqueiro com chama jet, ideal para acender charutos e uso em ambientes externos.",
      price: 80.00,
      stock: 50,
    )
    p.image.attach(io: File.open(Rails.root.join("spec", "support", "isqueiro-macarico.webp")), filename: "isqueiro-macarico.webp")
    # Act
    visit root_path
    # Assert
    expect(page).to have_content("Isqueiro Clássico Zippo")
    expect(page).to have_content("R$ 150,00")

    expect(page).to have_css('img[src*="isqueiro-macarico.webp"]')
    expect(page).to have_content("Isqueiro Jet Flame")
    expect(page).to have_content("R$ 80,00")

    expect(page).to have_link("Add to Cart")
    expect(page).not_to have_content("Nenhum produto cadastrado")
  end
  it "e não existem isqueiros/produtos cadastrados" do
    # Arrange

    # Act
    visit root_path
    # Assert
    expect(page).to have_content("Nenhum produto cadastrado")
  end
end
