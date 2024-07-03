require "rails_helper"
before do
  @user = User.create!(
    email: "isaac@email.com",
    password: "123456",
    name: "Isaac Smith",
    cpf: "12345678900",
    phone: "13900009999",
  )
  Address.create!(
    street: "Rua Dom Lara",
    number: "442",
    neighborhood: "Gonzaga",
    city: "Santos",
    state: "SP",
    postal_code: "87654-321",
    country: "Brasil",
    complement: "Apto 21",
    user: @user,
  )
  Address.create!(
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
  #
  #
  #allow(SecureRandom).to receive(:alphanumeric).with(8)and_return("ABCDE12345")
  #
  #
end
describe "Usuário cadastra um pedido" do
  it "se estiver autenticado" do
    # Arrange
    logout
    # Act
    visit new_address_path
    # Assert
    expect(current_path).to eq new_user_session_path
    expect(page).to have_content("Para continuar, faça login ou registre-se.")
  end
  it "a partir do carrinho" do
    # Arrange
    login_as(@user)
    # Act
    visit root_path
    click_on "Cart"
    click_on "Check Out"
    # Assert
    expect(current_path).to eq new_order_path
    expect(page).to have_link "Finalizar Compra"
  end

  it "a partir do detalhe de um produto" do
    # Arrange
    login_as(@user)
    # Act
    visit root_path
    click_on "Isqueiro Clássico Zippo"
    click_on "Check Out"
    # Assert
    expect(current_path).to eq new_order_path
    expect(page).to have_link "Finalizar Compra"
  end

  it "com sucesso" do
    # Arrange
    login_as(@user)
    # Act
    visit new_order_path
    click_on "Finalizar Compra"
    select "Avenida Paulista", from: "Endereço de Envio"
    click_on "Concluir"
    # Assert
    expect
    expect(page).to have_content "Pedido registrado com sucesso!"
    expect(page).to have_content "aguardando pagamento"
    expect(page).to have_content "Código do Pedido: ABCDE12345"
    expect(page).to have_content "Data do Pedido:"
    expect(page).to have_content "Valor:"
    expect(page).not_to have_content "Não é possivel fazer um pedido com carrinho vazio!"
  end

  it "com carrinho vazio" do
    # Arrange
    login_as(@user)
    # Act
    visit new_order_path
    # Assert
    expect(current_path).to eq root_path
    expect(page).to have_content "Não é possivel fazer um pedido com carrinho vazio!"
  end
  it "com data menor" do
    pending "add some examples to (or delete) #{__FILE__}"
  end
end
