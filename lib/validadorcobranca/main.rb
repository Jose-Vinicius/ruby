require "./lib/validadorcobranca/validador"
require "./lib/validadorcobranca/user"

u = User.new(1, "basic", "ativo", 7)
c = Cobranca.new(u)

c.gerar_cobranca
