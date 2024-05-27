require "rails_helper"

describe "Usuário se autentica" do
  before do
    @user = User.create!(email: "admin@email.com", password: "123456", name: "Hortencia", cpf: "12345678900", phone: "13900009999", role: "admin")
  end
  it "com sucesso" do
    # Arrange

    # Act
    visit root_path
    click_on "Entrar"
    within("form") do
      fill_in "E-mail", with: "admin@email.com"
      fill_in "Senha", with: "123456"
      click_on "Entrar"
    end
    # Assert
    within("nav") do
      expect(page).not_to have_link "Entrar"
      expect(page).to have_button "Sair"
      expect(page).to have_content "admin@email.com"
    end
    expect(page).to have_content "Login efetuado com sucesso."
  end
  it "e faz logout" do
    # Arrange
    login_as(@user)
    # Act
    visit root_path
    # click_on "Entrar"
    # within("form") do
    #   fill_in "E-mail", with: "admin@email.com"
    #   fill_in "Senha", with: "123456"
    #   click_on "Entrar"
    # end
    click_on "Sair"
    # Assert
    expect(current_path).to eq root_path
    within("nav") do
      expect(page).not_to have_button "Sair"
      expect(page).not_to have_content "admin@email.com"
      expect(page).to have_link "Entrar"
    end
    expect(page).to have_content "Logout efetuado com sucesso."
  end
end
