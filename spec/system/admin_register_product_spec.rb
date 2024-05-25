require "rails_helper"

describe "Admin cadastra um produto" do
  it "a partir da tela inicial e vê o formulario" do
    # Arrange

    # Act
    visit root_path
    click_on "Cadastrar Produto"
    # Assert
    expect(page).to have_field("Nome")
    expect(page).to have_field("Preço")
    expect(page).to have_field("Descrição")
    expect(page).to have_field("Estoque")
    expect(page).to have_field("Imagem")
    expect(page).to have_button("Salvar")
  end

  it "com sucesso" do
    # Arrange

    # Act
    visit root_path
    click_on "Cadastrar Produto"

    fill_in "Nome", with: "Isqueiro Jet Flame"
    fill_in "Preço", with: "80.00"
    fill_in "Descrição", with: "Isqueiro com chama jet, ideal para acender charutos e uso em ambientes externos."
    fill_in "Estoque", with: "50"
    attach_file "Imagem", Rails.root.join("spec", "support", "isqueiro-macarico.webp")

    click_on "Salvar"
    # Assert
    expect(current_path).to eq root_path
    expect(page).to have_content "Produto cadastrado com sucesso!"
    expect(page).to have_content "Isqueiro Jet Flame"
    expect(page).to have_content "80.00"
    expect(page).to have_css('img[src*="isqueiro-macarico.webp"]')
  end

  it "com dados incompletos" do
    # Arrange

    # Act
    visit root_path
    click_on "Cadastrar Produto"

    fill_in "Nome", with: ""
    fill_in "Preço", with: ""
    fill_in "Descrição", with: "Isqueiro com chama jet, ideal para acender charutos e uso em ambientes externos."
    fill_in "Estoque", with: ""
    attach_file "Imagem", Rails.root.join("spec", "support", "isqueiro-macarico.webp")

    click_on "Salvar"
    # Assert
    expect(page).to have_content "Produto não cadastrado!"
    expect(page).not_to have_content "Produto cadastrado com sucesso!"
  end
end
