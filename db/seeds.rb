# Cria Produtos

produto = Product.create!(
  name: "Isqueiro Plasma Duplo Arco",
  description: "Isqueiro de plasma com duplo arco elétrico. Recarregável via USB, seguro e inovador.",
  price: 120.00,
  stock: 25,
)
produto.image.attach(io: File.open(Rails.root.join("spec", "support", "isqueiro-plasma-duplo-arco.png")), filename: "isqueiro-plasma-duplo-arco.png")
