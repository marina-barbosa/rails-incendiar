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
end
