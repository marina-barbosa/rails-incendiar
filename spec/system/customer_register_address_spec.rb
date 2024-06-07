require "rails_helper"

describe "Cliente cadastra um endereço" do
  before do
    @user = User.create!(
      email: "isaac@email.com",
      password: "123456",
      name: "Isaac",
      cpf: "22345678900",
      phone: "13900002222",
      role: "customer",
    )
  end
  it "se estiver autenticado" do
    # Arrange
    logout
    # Act
    visit new_address_path
    # Assert
    expect(current_path).to eq new_user_session_path
    expect(page).to have_content("Para continuar, faça login ou registre-se.")
  end
  it "a partir da tela inicial e vê o formulario" do
    # Arrange
    login_as(@user)
    # Act
    visit root_path
    click_on "isaac@email.com"
    click_on "Novo endereço"
    # Assert
    expect(current_path).to eq new_address_path
    expect(page).to have_field("Rua")
    expect(page).to have_field("Número")
    expect(page).to have_field("Bairro")
    expect(page).to have_field("Cidade")
    expect(page).to have_field("Estado")
    expect(page).to have_field("CEP")
    expect(page).to have_field("País")
    expect(page).to have_field("Complemento")
    expect(page).to have_button("Salvar")
  end

  it "com sucesso" do
    # Arrange
    login_as(@user)
    # Act
    visit root_path
    click_on "isaac@email.com"
    click_on "Novo endereço"

    fill_in "Rua", with: "Av. Paulista"
    fill_in "Número", with: "123"
    fill_in "Bairro", with: "Bela Vista"
    fill_in "Cidade", with: "São Paulo"
    fill_in "Estado", with: "SP"
    fill_in "CEP", with: "01311-000"
    fill_in "País", with: "Brasil"
    fill_in "Complemento", with: "Apto 101"

    click_on "Salvar"
    # Assert
    expect(current_path).to eq(user_path(@user))
    expect(page).to have_content("Av. Paulista")
    expect(page).to have_content("123")
    expect(page).to have_content("Bela Vista")
    expect(page).to have_content("São Paulo")
    expect(page).to have_content("SP")
    expect(page).to have_content("01311-000")
    expect(page).to have_content("Brasil")
    expect(page).to have_content("Apto 101")
  end

  it "com dados incompletos" do
    # Arrange
    login_as(@user)
    # Act
    visit root_path
    click_on "isaac@email.com"
    click_on "Novo endereço"

    fill_in "Rua", with: ""
    fill_in "Número", with: ""
    fill_in "Bairro", with: ""
    fill_in "Cidade", with: ""
    fill_in "Estado", with: ""
    fill_in "CEP", with: ""
    fill_in "País", with: ""
    fill_in "Complemento", with: "Apto 101"

    click_on "Salvar"
    # Assert
    expect(page).to have_content "Endereço não cadastrado!"
    expect(page).to have_content "Rua não pode ficar em branco"
    expect(page).to have_content "Cidade não pode ficar em branco"
    expect(page).to have_content "CEP não pode ficar em branco"
    expect(page).not_to have_content "Endereço cadastrado com sucesso!"
  end
end
