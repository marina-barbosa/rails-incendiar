require "rails_helper"

describe "Admin edita um produto" do
  before do
    @produto = Product.create!(
      name: "Isqueiro Jet Flame",
      price: 80.00,
      description: "Isqueiro com chama jet, ideal para acender charutos e uso em ambientes externos.",
      stock: 50,
    )
    @produto.image.attach(io: File.open(Rails.root.join("spec", "support", "isqueiro-macarico.webp")), filename: "isqueiro-macarico.webp")
  end
  it "a partir da tela de detalhes e vê o formulário" do
    # Arrange

    # Act
    visit root_path
    click_on "Isqueiro Jet Flame"
    click_on "Editar"

    # Assert
    expect(page).to have_content("Editar Produto")
    expect(page).to have_field("Nome", with: "Isqueiro Jet Flame")
    expect(page).to have_field("Preço", with: "80.00")
    expect(page).to have_field("Descrição", with: "Isqueiro com chama jet, ideal para acender charutos e uso em ambientes externos.")
    expect(page).to have_field("Estoque", with: "50")
    expect(page).to have_field("Imagem")
    expect(page).to have_button("Salvar")
  end
  it "com sucesso" do
    # Arrange

    # Act
    visit edit_product_path(@produto.id)

    fill_in "Nome", with: "Isqueiro Maçarico"
    fill_in "Preço", with: "70.00"
    fill_in "Descrição", with: "Isqueiro ideal para uso em ambientes externos."
    fill_in "Estoque", with: "25"
    attach_file "Imagem", Rails.root.join("spec", "support", "macarico-azul.jpeg")

    click_on "Salvar"

    # Assert
    expect(current_path).to eq product_path(@produto.id)
    expect(page).to have_content "Produto alterado com sucesso!"
    expect(page).to have_content "Isqueiro Maçarico"
    expect(page).to have_content "70,00"
    expect(page).to have_content "Isqueiro ideal para uso em ambientes externos."
    expect(page).to have_content "25"
    expect(page).to have_css('img[src*="macarico-azul.jpeg"]')
  end
  it "e mantém os campos obrigatórios" do
    # Arrange

    # Act
    visit edit_product_path(@produto.id)

    fill_in "Nome", with: ""
    fill_in "Preço", with: ""

    click_on "Salvar"

    # Assert
    expect(page).to have_content "Não foi possível atualizar o produto"
  end
end
