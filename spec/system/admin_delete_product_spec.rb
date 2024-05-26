require "rails_helper"

describe "Admin delete um produto" do
  before do
    @product = Product.create!(
      name: "Isqueiro Jet Flame",
      price: 80.00,
      description: "Isqueiro com chama jet, ideal para acender charutos e uso em ambientes externos.",
      stock: 50,
    )
    @product.image.attach(io: File.open(Rails.root.join("spec", "support", "isqueiro-macarico.webp")), filename: "isqueiro-macarico.webp")

    second_product = Product.create!(
      name: "Isqueiro Plasma Duplo Arco",
      description: "Isqueiro de plasma com duplo arco elétrico. Recarregável via USB, seguro e inovador.",
      price: 120.00,
      stock: 25,
    )
    second_product.image.attach(io: File.open(Rails.root.join("spec", "support", "isqueiro-plasma-duplo-arco.png")), filename: "isqueiro-plasma-duplo-arco.png")
  end
  it "com sucesso" do
    # Arrange

    # Act
    visit root_path
    click_on "Isqueiro Jet Flame"
    click_on "Remover"
    # Assert
    expect(current_path).to eq root_path
    expect(page).to have_content("Produto removido com sucesso!")
    expect(page).not_to have_content "Isqueiro Maçarico"
    expect(page).not_to have_css('img[src*="isqueiro-macarico.webp"]')
  end
  it "e não apaga outros produtos" do
    # Arrange

    # Act
    visit root_path
    click_on "Isqueiro Jet Flame"
    click_on "Remover"
    # Assert
    expect(current_path).to eq root_path
    expect(page).to have_content("Produto removido com sucesso!")
    expect(page).not_to have_content "Isqueiro Maçarico"
    expect(page).not_to have_css('img[src*="isqueiro-macarico.webp"]')
    expect(page).to have_content("Isqueiro Plasma Duplo Arco")
    expect(page).to have_css('img[src*="isqueiro-plasma-duplo-arco.png"]')
  end
end
