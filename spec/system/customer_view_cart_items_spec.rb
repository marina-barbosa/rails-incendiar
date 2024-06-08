require "rails_helper"

describe "Cliente visita seu carrinho" do
  before do
    @user = User.create!(
      email: "isaac@email.com",
      password: "123456",
      name: "Isaac Smith",
      cpf: "12345678900",
      phone: "13900009999",
    )
    @first_product = Product.create!(
      name: "Isqueiro Clássico Zippo",
      description: "Isqueiro à prova de vento com garantia vitalícia. Modelo clássico da Zippo.",
      price: 150.00,
      stock: 30,
    )
    @second_product = Product.create!(
      name: "Isqueiro Bic",
      description: "Isqueiro simples.",
      price: 10.00,
      stock: 200,
    )
    @cart_item1 = CartItem.create!(user: @user, product: @first_product, quantity: 1)
    @cart_item2 = CartItem.create!(user: @user, product: @second_product, quantity: 2)
  end
  it "se estiver autenticado" do
    # Arrange
    logout
    # Act
    visit cart_items_path
    # Assert
    expect(current_path).to eq new_user_session_path
    expect(page).to have_content("Para continuar, faça login ou registre-se.")
  end
  it "a partir da tela inicial e vê todos produtos adicionados" do
    # Arrange
    login_as(@user)
    # Act
    visit root_path
    click_on "Cart"
    # Assert
    expect(page).to have_selector("table th", text: "Quantidade")
    expect(page).to have_content "Isqueiro Clássico Zippo"
    expect(page).to have_selector("table td", text: "1")
    expect(page).to have_content "Isqueiro Bic"
    expect(page).to have_selector("table td", text: "2")
  end
end
