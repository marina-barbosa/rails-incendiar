require "rails_helper"

describe "Admin cadastra um produto" do
  before do
    @user = User.create!(
      email: "admin@email.com",
      password: "123456",
      name: "Hortencia",
      cpf: "12345678900",
      phone: "13900009999",
      role: "admin",
    )
  end
  it "se estiver autenticado" do
    # Arrange
    logout
    # Act
    visit new_product_path
    # Assert
    expect(current_path).to eq new_user_session_path
    expect(page).to have_content("Para continuar, faça login ou registre-se.")
  end
  it "a partir da tela inicial e vê o formulario" do
    # Arrange
    login_as(@user)
    # Act
    visit root_path
    click_on "Cadastrar Produto"
    # Assert
    expect(current_path).to eq new_product_path
    expect(page).to have_field("Nome")
    expect(page).to have_field("Preço")
    expect(page).to have_field("Descrição")
    expect(page).to have_field("Estoque")
    expect(page).to have_field("Imagem")
    expect(page).to have_button("Salvar")
  end

  it "com sucesso" do
    # Arrange
    login_as(@user)
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
    expect(page).to have_content "80,00"
    expect(page).to have_css('img[src*="isqueiro-macarico.webp"]')
  end

  it "com dados incompletos" do
    # Arrange
    login_as(@user)
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
    expect(page).to have_content "Nome não pode ficar em branco"
    expect(page).to have_content "Preço não pode ficar em branco"
    expect(page).to have_content "Estoque não pode ficar em branco"
    expect(page).not_to have_content "Produto cadastrado com sucesso!"
  end
end
