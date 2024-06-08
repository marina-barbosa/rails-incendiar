require "rails_helper"

describe "Usuário vê detalhes de seu perfil" do
  before do
    @user = User.create!(
      email: "isaac@email.com",
      password: "123456",
      name: "Isaac",
      cpf: "22345678900",
      phone: "13900002222",
      role: "customer",
    )
    address = Address.create!(
      street: "Avenida Paulista",
      number: "123",
      neighborhood: "Centro",
      city: "São Paulo",
      state: "SP",
      postal_code: "12345-678",
      country: "Brasil",
      complement: "Apto 101",
      user: @user,
    )
  end
  it "e vê suas informações" do
    # Arrange
    login_as(@user)
    # Act
    visit root_path
    click_on "isaac@email.com"
    # Assert
    expect(current_path).to eq user_path(@user)
    expect(page).to have_content("Isaac")
    expect(page).to have_content("isaac@email.com")
    expect(page).to have_content("22345678900")
    expect(page).to have_content("13900002222")
  end
  it "e vê endereço se tiver cadastrado" do
    # Arrange
    login_as(@user)
    # Act
    visit root_path
    click_on "isaac@email.com"
    # Assert
    expect(page).to have_content("Avenida Paulista")
    expect(page).to have_content("123")
    expect(page).to have_content("Centro")
    expect(page).to have_content("São Paulo")
    expect(page).to have_content("SP")
    expect(page).to have_content("12345-678")
    expect(page).to have_content("Brasil")
    expect(page).to have_content("Apto 101")
  end
end
