require "rails_helper"

describe "Usuário cria uma conta" do
  it "com sucesso" do
    # Arrange

    # Act
    visit root_path
    click_on "Entrar"
    within("main") do
      click_on "Criar uma conta"
      fill_in "E-mail", with: "isaac@email.com"
      fill_in "Nome", with: "Isaac Flores"
      fill_in "Telefone", with: "13900008888"
      fill_in "Cpf", with: "12345678911"
      fill_in "Senha", with: "123456"
      fill_in "Confirme sua senha", with: "123456"
      click_on "Criar conta"
    end
    # Assert
    expect(page).to have_content "isaac@email.com"
    expect(page).to have_button "Sair"
    expect(page).to have_content "Boas vindas! Você realizou seu registro com sucesso."
    user = User.last
    expect(user.name).to eq "Isaac Flores"
    expect(user.cpf).to eq "12345678911"
  end
  # it "" do
  #   # Arrange

  #   # Act

  #   # Assert
  # end
end
