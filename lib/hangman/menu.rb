# este modulo é responsavel por gerenciar os menus do sistema
module Menu
  def self.principal
    "Vamos jogar Hangman\nEscolha uma opção abaixo:\n1 - Novo jogo\n2 - Carregar jogo\n3 - Sair"
  end

  def self.in_game
    "Escolha o que deseja fazer:\n1 - Proxima Letra\n2 - Salvar progresso\n3 - Sair"
  end
end
