# Cria conta admin
User.create!(
  email: "admin@email.com",
  password: "123456",
  name: "Hortencia",
  cpf: "12345678900",
  phone: "13900009999",
  role: "admin",
)
# Cria conta customer
User.create!(
  email: "isaac@email.com",
  password: "123456",
  name: "Isaac",
  cpf: "22345678900",
  phone: "13900008888",
  role: "customer",
)

# Cria Produtos
produto = Product.create!(
  name: "Isqueiro Plasma Duplo Arco",
  description: "Isqueiro de plasma com duplo arco elétrico. Recarregável via USB, seguro e inovador.",
  price: 120.00,
  stock: 25,
)
produto.image.attach(io: File.open(Rails.root.join("spec", "support", "isqueiro-plasma-duplo-arco.png")), filename: "isqueiro-plasma-duplo-arco.png")
